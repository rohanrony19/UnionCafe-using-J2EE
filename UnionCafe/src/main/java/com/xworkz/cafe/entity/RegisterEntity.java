package com.xworkz.cafe.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;
import java.time.Instant;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user_register")
@NamedQueries({
        @NamedQuery(
                name = "findByEmail",
                query = "SELECT r FROM RegisterEntity r WHERE r.email = :email"
        ),
        @NamedQuery(
                name = "checkMail",
                query = "SELECT COUNT(r) FROM RegisterEntity r WHERE r.email = :emailBy"
        ),
        @NamedQuery(
                name = "updatePasswordByEmail",
                query = "UPDATE RegisterEntity r SET r.password = :password WHERE r.email = :email"
        ),
        @NamedQuery(
                name = "findPasswordByEmail",
                query = "SELECT r.password FROM RegisterEntity r WHERE r.email = :email"
        )

})
public class RegisterEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;  // Primary key field

    @Column(name = "full_name", nullable = false, length = 50)
    private String fullName;

    @Column(name = "phone_number", nullable = false, length = 10)
    private String phoneNumber;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "address")
    private String address;

    @Column(name = "age")
    private Integer age;

    @Column(name = "login_attempt")
    private Integer loginAttempt = 0;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "last_login_at")
    private LocalDateTime lastLoginAt;

    @Column(name = "image_path")
    private String imagePath;
}
