package com.xworkz.cafe.dto;

import lombok.*;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterDTO implements Serializable {

    @NotBlank(message = "Full Name is required")
    @Size(min = 3, max = 50, message = "Full Name must be between 3 and 50 characters")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "Full Name must contain only letters and spaces")
    private String fullName;

    @NotNull(message = "Phone Number is required")
    @Pattern(regexp = "^[0-9]{10}$", message = "Phone Number must be exactly 10 digits")
    private String phoneNumber;

    @NotBlank(message = "Email is required")
    @Email(message = "Email is invalid")
    private String email;

    @NotBlank(message = "Password is required")
    @Pattern(
            regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$",
            message = "Password must be at least 8 characters with letters, numbers and special characters"
    )
    private String password;

    @NotBlank(message = "Confirm Password is required")
    private String confirmPassword;

}
