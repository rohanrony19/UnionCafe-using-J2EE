package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.entity.RegisterEntity;
import com.xworkz.cafe.repository.RegisterRepository;
import com.xworkz.cafe.repository.RegisterRepositoryImpli;
import jakarta.mail.MessagingException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Properties;

public class RegisterServiceImpl implements RegisterService{

    RegisterRepository repository = new RegisterRepositoryImpli();
    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public boolean save(RegisterDTO dto) {
        if (dto.getPassword() == null || !dto.getPassword().equals(dto.getConfirmPassword())) {
            System.out.println("Password and Confirm Password do not match");
            return false;
        }
        if (repository.checkMail(dto.getEmail())) {
            System.out.println("Email already exists!");
            return false;
        }
        RegisterEntity entity = new RegisterEntity();
        entity.setFullName(dto.getFullName());
        entity.setEmail(dto.getEmail());
        getEmail(entity.getEmail(), "Register Successful","Dear " + dto.getFullName() + ",\n\nYour registration for TravelFlow is successful.");
        entity.setPhoneNumber(dto.getPhoneNumber());
        entity.setAddress(dto.getAddress());
        entity.setAge(dto.getAge());
        entity.setCreatedAt(LocalDateTime.now());
        entity.setPassword(passwordEncoder.encode(dto.getPassword()));
        entity.setLoginAttempt(0);
        return repository.save(entity);
    }

    @Override
    public boolean login(String email, String password) {
        RegisterEntity entity = repository.findByEmail(email);
        if (entity == null){
            System.out.println("Email not found");
            return false;
        }
        if (passwordEncoder.matches(password,entity.getPassword())){
            entity.setLastLoginAt(LocalDateTime.now());
            repository.save(entity);
            System.out.println("Login successful");
            return true;
        }else {
            System.out.println("Invalid Password");
            return false;
        }
    }

    @Override
    public boolean isEmailRegistered(String email) {
        return repository.checkMail(email);
    }

    @Override
    public void sendOtpEmail(String email, int otpValue) throws MessagingException {
        String subject = "OTP for Password Reset";
        String body = "Dear user,\n\nYour OTP for password reset is: " + otpValue +
                "\n\nDo not share this OTP with anyone.";

        getEmail(email, subject, body);
    }

    @Override
    public boolean updatePassword(String email, String newPassword) {
        String encodedPassword = passwordEncoder.encode(newPassword);

        // 2. Call repository to update password
        boolean updated = repository.updatePassword(email, encodedPassword);

        if (updated) {
            System.out.println("Password updated successfully for " + email);
        } else {
            System.out.println("Failed to update password for " + email);
        }

        return updated;
    }

    @Override
    public RegisterDTO displayDetailFromEmail(String email) {
        RegisterEntity entity = repository.findByEmail(email); // fetch entity
        if (entity == null) return null;

        RegisterDTO dto = new RegisterDTO();
        dto.setFullName(entity.getFullName());
        dto.setEmail(entity.getEmail());
        dto.setPhoneNumber(entity.getPhoneNumber());
        dto.setAddress(entity.getAddress());
        dto.setAge(entity.getAge());
        return dto;
    }

    @Override
    public boolean existsByEmail(String email) {
        return repository.checkMail(email);
    }


    public void getEmail(String email,String subject,String body){
        final String username = "rohanprasad.rony@gmail.com";
        final String password = "mlom rihf ptwn ahdz";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }

