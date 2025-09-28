package com.xworkz.cafe.repository;

import com.xworkz.cafe.entity.BookingEntity;

import java.util.List;

public interface BookingRepository {

    boolean save(BookingEntity booking);

    BookingEntity findById(int id);

    List<BookingEntity> findAll();

    boolean update(BookingEntity booking);

    boolean delete(int id);
}
