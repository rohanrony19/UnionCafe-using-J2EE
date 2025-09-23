package com.xworkz.cafe.servlet;

import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpl;
import jakarta.mail.MessagingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Random;

@WebServlet("/Home/User/ForgotPassword")
public class ForgotPassServlet extends HttpServlet {

    RegisterService registerService= new RegisterServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        RequestDispatcher dispatcher;
        HttpSession session = req.getSession();

        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("emailError", "Please enter a valid email");
            req.setAttribute("email", email);
            dispatcher = req.getRequestDispatcher("/Home/User/ForgotPassword.jsp");
        } else if (!registerService.isEmailRegistered(email)) {
            req.setAttribute("emailError", "Email is not registered.");
            req.setAttribute("email", email);
            dispatcher = req.getRequestDispatcher("/Home/User/ForgotPassword.jsp");
        } else {
            int otpValue = new Random().nextInt(999999);
            try {
                registerService.sendOtpEmail(email, otpValue);
                session.setAttribute("otp", otpValue);
                session.setAttribute("email", email);
                dispatcher = req.getRequestDispatcher("/Home/User/otpVerify.jsp");
            } catch (MessagingException e) {
                e.printStackTrace();
                req.setAttribute("errorMessage", "Failed to send OTP email. Please try again later.");
                req.setAttribute("email", email);
                dispatcher = req.getRequestDispatcher("/Home/User/ForgotPassword.jsp");
            }
        }
        dispatcher.forward(req, resp);
    }
}
