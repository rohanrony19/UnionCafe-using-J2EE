package com.xworkz.Bakery.dto;

import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode

public class RegisterDTO implements Serializable {
    private String fullName;
    private long phoneNumber;
    private String email;
    private String password;
    private String confirmPassword;

    @Override
    public String toString() {
        return "RegisterDTO{" +
                "fullName='" + fullName + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                '}';
    }
}
