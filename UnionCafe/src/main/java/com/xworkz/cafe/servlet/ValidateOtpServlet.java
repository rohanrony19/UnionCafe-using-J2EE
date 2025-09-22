package com.xworkz.cafe.servlet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Home/User/ValidateOtp")
public class ValidateOtpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String enteredOtp = req.getParameter("otp");
        HttpSession session = req.getSession(false);
        RequestDispatcher dispatcher;

        if (session == null) {
            // Session expired or no session
            req.setAttribute("message", "Session expired. Please try again.");
            dispatcher = req.getRequestDispatcher("/Home/User/ForgotPassword.jsp");
        } else {
            Integer otp = (Integer) session.getAttribute("otp");
            String email = (String) session.getAttribute("email");

            if (otp != null && email != null && enteredOtp != null && enteredOtp.equals(String.valueOf(otp))) {
                // OTP matched, forward to reset password page
                dispatcher = req.getRequestDispatcher("/Home/User/ResetPassword.jsp");
            } else {
                // OTP did not match
                req.setAttribute("message", "Invalid OTP. Please try again.");
                dispatcher = req.getRequestDispatcher("/Home/User/otpVerify.jsp");
            }
        }
        dispatcher.forward(req, resp);
    }
}
