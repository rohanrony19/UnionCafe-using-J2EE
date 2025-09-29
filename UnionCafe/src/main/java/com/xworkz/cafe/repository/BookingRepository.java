package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.BookingEntity;

import java.time.LocalDate;
import java.util.List;

public interface BookingRepository {

    boolean save(BookingEntity booking);
    List<BookingEntity> findByEmail(String email);
    boolean delete(int id);
    boolean existsByEmailAndDate(String email, LocalDate date);

}
