package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.RegisterDTO;
import jakarta.mail.MessagingException;

public interface RegisterService {
    String validate(RegisterDTO registerDTO);
    String loginValidation(String mail, String password);
//    String forgotPassword(String email,String password,String confirmPassword);
    RegisterDTO displayDetailFromEmail( String Email);
    boolean checkMail(String email);
    void sendOtpEmail(String email, int otp) throws MessagingException;
    public boolean isEmailRegistered(String email);
    boolean updatePassword(String email, String newPassword);
}
