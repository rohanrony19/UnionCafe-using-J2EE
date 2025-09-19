package com.xworkz.cafe.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "admin_login")
@NamedQuery(name="checkEmail",query = "select e from AdminLoginEntity e where e.email=:email")
public class AdminLoginEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name="login_attempt")
    private int loginAttempt=0;

    @Column(name="local_date_time")
    private LocalDateTime localDateTime;
}
