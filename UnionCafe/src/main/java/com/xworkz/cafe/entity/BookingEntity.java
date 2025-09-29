package com.xworkz.cafe.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "bookings")
@Data
@NoArgsConstructor
@AllArgsConstructor
//@NamedQuery(
//        name = "findAllBookings",
//        query = "SELECT b FROM BookingEntity b"
//)
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "check_in_date")
    private LocalDate checkInDate;   // SQL DATE

    @Column(name = "check_in_time")
    private LocalTime checkInTime;   // SQL TIME

    @Column(name = "number_of_guests")
    private int numberOfGuests;
}
