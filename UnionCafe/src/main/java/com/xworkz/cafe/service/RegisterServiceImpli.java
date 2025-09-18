package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.repository.RegisterRepository;
import com.xworkz.cafe.repository.RegisterRepositoryImpli;
import jakarta.mail.MessagingException;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


public class RegisterServiceImpli implements RegisterService {

    RegisterRepository registerRepository = new RegisterRepositoryImpli();
//    @Override
//    public String validate(RegisterDTO registerDTO) {
//
//        if (registerDTO!=null){
//            if (isInvalidName(registerDTO.getFullName())) {
//                return "nameError";
//            }
//            if (isInvalidValidEmail(registerDTO.getEmail())){
//                return "emailError";
//            }
//            if (!isMailExist(registerDTO.getEmail())){

    /// /                System.out.println("is mail exist :"+isMailExist(registerDTO.getEmail()));
//                return "mailExistError";
//            }
//            if(!isInvalidNumber(registerDTO.getPhoneNumber())){
//                System.out.println("password invalid");
//                return "NumberError";
//            }
//            if(isInvalidPassword(registerDTO.getPassword() )){
//                return "passwordError";
//            }
//            if(isInvalidConfirmPassword(registerDTO.getPassword(),registerDTO.getConfirmPassword())){
//                return "confirmPasswordError";
//            }
//            registerRepository.save(registerDTO);
//            return "Correct validation";
//        }
//        return "emptyDto";
//    }
    @Override
    public String validate(RegisterDTO registerDTO) {
        if (registerDTO != null) {
            List<String> errors = new ArrayList<>();

            if (isInvalidName(registerDTO.getFullName())) {
                errors.add("nameError");
            }
            if (isInvalidValidEmail(registerDTO.getEmail())) {
                errors.add("emailError");
            }
            if (!isMailExist(registerDTO.getEmail())) {
                errors.add("mailExistError");
            }
            if (!isInvalidNumber(Long.parseLong(registerDTO.getPhoneNumber()))) {
                errors.add("NumberError");
            }
            if (isInvalidPassword(registerDTO.getPassword())) {
                errors.add("passwordError");
            }
            if (isInvalidConfirmPassword(registerDTO.getPassword(), registerDTO.getConfirmPassword())) {
                errors.add("confirmPasswordError");
            }

            if (!errors.isEmpty()) {
                return String.join(",", errors);  // e.g. "nameError,emailError,passwordError"
            }
            String hashedPassword = PasswordUtil.hashPassword(registerDTO.getPassword());
            registerDTO.setPassword(hashedPassword);

            // Save DTO (with hashed password)
            registerRepository.save(registerDTO);
            return "Correct validation";
        }
        return "emptyDto";
    }

    private boolean isInvalidName(String name) {
        if (name == null || name.trim().isEmpty() || name.length() < 3) {
            return true;
        }
        return false;
    }

    private boolean isInvalidValidEmail(String email) {
        String emailPattern = "^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$";
        return email == null || !Pattern.matches(emailPattern, email);
    }

    private boolean isInvalidNumber(long number) {
        if (number < 1000000000L || number > 9999999999L) {
            return false;
        }
        return true;
    }


    private boolean isInvalidConfirmPassword(String password, String confirmPassword) {
        if (password == null || !password.equals(confirmPassword)) {
            return true;
        }
        return false;
    }

    private boolean isInvalidPassword(String password) {
        if (password == null) return true;

        // Must be at least 8 characters and contain a letter, number, and special character
        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return !Pattern.matches(passwordPattern, password);
    }


    private boolean isMailExist(String mail) {
        System.out.println("mail in service" + mail);
        if (registerRepository.checkMail(mail)) {

            System.out.println("is result coming in service from repo--->" + registerRepository.checkMail(mail));

            return false;
        }
        return true;
    }

    @Override
    public String loginValidation(String mail, String password) {
        if (!registerRepository.checkMail(mail)) {
            return "emailError";
        } else if (!password.equals(registerRepository.getPassword(mail))) {
            System.out.println("password invalid");
            return "PasswordError";
        }
        return "validData";
    }

//    @Override
//    public String forgotPassword(String email, String password, String confirmPassword) {
//        System.out.println("im in service");
//
//        if (!registerRepository.checkMail(email)) {
//            return "emailError";
//        }
//        if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")) {
//            System.out.println("invalid character");
//            return "passwordError";
//        }
//        if (!password.equals(confirmPassword)) {
//            return "confirmPasswordError";
//        }
//
//        registerRepository.updatePassword(email, password);
//        System.out.println("valid");
//        return "validateForgotPassword";
//    }

    @Override
    public RegisterDTO displayDetailFromEmail(String Email) {
        System.out.println("Service: checking email " + Email);

        RegisterDTO dto = registerRepository.displayAllDataFromEmail(Email);

        // If dto is null → email not found
        if (dto == null) {
            System.out.println("Email not found: " + Email);
            return null;
        }

        // Optionally, if you expect only one unique record:
        // You could enforce a uniqueness check in the repository (count query) if needed.

        System.out.println("Email found → returning user details");
        return dto;
    }

    @Override
    public boolean checkMail(String email) {

        return registerRepository.checkMail(email);
    }

    @Override
    public void sendOtpEmail(String email, int otp) throws MessagingException {
        String subject = "Password Reset OTP";
        String content = "Your OTP for password reset is: " + otp;
        com.xworkz.cafe.util.EmailUtil.sendEmail(email, subject, content);
    }

    @Override
    public boolean isEmailRegistered(String email) {
        return registerRepository.checkMail(email);
    }

    @Override
    public boolean updatePassword(String email, String newPassword) {
        String hashedPassword = PasswordUtil.hashPassword(newPassword);
        return registerRepository.updatePassword(email, hashedPassword);

    }

}




