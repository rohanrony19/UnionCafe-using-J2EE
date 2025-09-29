package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.BookingDto;

import java.time.LocalDate;
import java.util.List;

public interface BookingService {
    boolean saveBooking(BookingDto dto);
    List<BookingDto> getBookingsByUser(String email);
    boolean deleteBooking(int id);
    boolean existsBookingForEmailAndDate(String email, LocalDate date);
}
