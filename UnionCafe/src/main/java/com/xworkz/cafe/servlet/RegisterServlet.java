package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Home/User/Register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("running doGet in RegisterServlet");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Home/User/Register.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("running doPost in RegisterServlet");
        RegisterService registerService = new RegisterServiceImpl();
        // Collect form values
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        boolean hasError = false;

        // Validation
        if (fullName == null || fullName.trim().isEmpty()) {
            req.setAttribute("fullNameError", "Full name is required.");
            hasError = true;
        }
        if (phoneNumber == null || !phoneNumber.matches("\\d{10}")) {
            req.setAttribute("phoneError", "Enter a valid 10-digit phone number.");
            hasError = true;
        }
        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            req.setAttribute("emailError", "Enter a valid email address.");
            hasError = true;
        }

        if (registerService.existsByEmail(email)) {
            req.setAttribute("mailExistError", "Email already exists. Please use another.");
            hasError = true;
        }
        if (password == null || password.length() < 8) {
            req.setAttribute("passwordError", "Password must be at least 8 characters.");
            hasError = true;
        }
        if (confirmPassword == null || !confirmPassword.equals(password)) {
            req.setAttribute("confirmPasswordError", "Passwords do not match.");
            hasError = true;
        }

        // If validation failed, go back to form with errors
        if (hasError) {
            req.getRequestDispatcher("/Home/User/Register.jsp").forward(req, resp);
            return;
        }

        // DTO mapping
        RegisterDTO registerDTO = new RegisterDTO();
        registerDTO.setFullName(fullName);
        registerDTO.setPhoneNumber(phoneNumber);
        registerDTO.setEmail(email);
        registerDTO.setPassword(password);
        registerDTO.setConfirmPassword(confirmPassword);

        // Service call

        boolean isSaved = registerService.save(registerDTO);

        // Forward with message
        if (isSaved) {
            req.setAttribute("success", "Registration successful!");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/Home/User/Login.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed. Try again.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/Home/User/Register.jsp");
            dispatcher.forward(req, resp);
        }


    }
}
