package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.RegisterDTO;

public interface RegisterService {
    String validate(RegisterDTO registerDTO);
    String loginValidation(String mail, String password);
    String forgotPassword(String email,String password,String confirmPassword);
    RegisterDTO displayDetailFromEmail( String Email);
}
