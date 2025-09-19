package com.xworkz.cafe.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminVerifyDTO {

    @Pattern(regexp = "^[A-Za-z0-9]+@gmail\\.com$",message = "email doesn't match")
    private String email;

    @Pattern(regexp = "^[0-9]{6}$", message = "OTP must be 6 digits")
    private String otp;
}
