package com.xworkz.cafe.service;
import com.xworkz.cafe.dto.BookingDto;
import com.xworkz.cafe.entity.BookingEntity;
import com.xworkz.cafe.repository.BookingRepository;
import com.xworkz.cafe.repository.BookingRepositoryImpl;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class BookingServiceImpl implements BookingService {

    BookingRepository repository = new BookingRepositoryImpl();

    @Override
    public boolean saveBooking(BookingDto dto) {
        // Basic null and range validation
        if (dto.getName() == null || dto.getName().trim().isEmpty()) {
            return false; // name required
        }
        if (dto.getEmail() == null || !dto.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return false; // valid email required
        }
        if (dto.getPhoneNumber() == null || !dto.getPhoneNumber().matches("\\d{10}")) {
            return false; // valid 10-digit phone number
        }
        if (dto.getNumberOfGuests() <= 0 || dto.getNumberOfGuests() > 20) {
            return false; // guests must be 1-20
        }
        if (dto.getCheckInDate() == null || dto.getCheckInDate().isBefore(LocalDate.now())) {
            return false; // check-in date can't be in the past
        }
        if (dto.getCheckInTime() == null || dto.getCheckInTime().isBefore(LocalTime.of(10,0)) || dto.getCheckInTime().isAfter(LocalTime.of(22,0))) {
            return false; // time between 10:00 and 22:00
        }

        // Check for existing booking on same date/email
        if (repository.existsByEmailAndDate(dto.getEmail(), dto.getCheckInDate())) {
            return false; // duplicate booking not allowed
        }

        // Convert DTO -> Entity
        BookingEntity booking = new BookingEntity();
        booking.setName(dto.getName().trim());
        booking.setEmail(dto.getEmail().trim());
        booking.setPhoneNumber(dto.getPhoneNumber().trim());
        booking.setNumberOfGuests(dto.getNumberOfGuests());
        booking.setCheckInDate(dto.getCheckInDate());
        booking.setCheckInTime(dto.getCheckInTime());

        // Save booking
        return repository.save(booking);
    }


    @Override
    public List<BookingDto> getBookingsByUser(String email) {
        List<BookingEntity> entities = repository.findByEmail(email);
        List<BookingDto> dtos = new ArrayList<>();

        for (BookingEntity b : entities) {
            BookingDto dto = new BookingDto(
                    b.getId(),
                    b.getName(),
                    b.getEmail(),
                    b.getPhoneNumber(),
                    b.getCheckInDate(),
                    b.getCheckInTime(),
                    b.getNumberOfGuests()
            );
            dtos.add(dto);
        }

        return dtos;
    }

    @Override
    public boolean deleteBooking(int id) {
        return repository.delete(id);
    }

    @Override
    public boolean existsBookingForEmailAndDate(String email, LocalDate date) {
        return repository.existsByEmailAndDate(email, date);
    }
}
