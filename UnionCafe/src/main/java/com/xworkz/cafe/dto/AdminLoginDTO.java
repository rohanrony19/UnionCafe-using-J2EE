package com.xworkz.cafe.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminLoginDTO {

    @Pattern(regexp = "^[A-Za-z0-9]+@gmail\\.com$",message = "email doesn't match")
    private String email;


    @Pattern(
            regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$",
            message = "Password must be at least 8 characters with letters, numbers and special characters"
    )
    private String password;
}
