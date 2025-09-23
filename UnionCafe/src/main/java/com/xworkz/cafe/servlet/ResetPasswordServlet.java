package com.xworkz.cafe.servlet;

import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Home/User/ResetPassword")
public class ResetPasswordServlet extends HttpServlet {
    private RegisterService registerService = new RegisterServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confPassword");
        HttpSession session = req.getSession(false);
        RequestDispatcher dispatcher;

        if (session == null) {
            req.setAttribute("message", "Session expired. Please try again.");
            dispatcher = req.getRequestDispatcher("/Home/User/ForgotPassword.jsp");
        } else {
            String email = (String) session.getAttribute("email");
            if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
                req.setAttribute("errorMsg", "Passwords do not match.");
                dispatcher = req.getRequestDispatcher("/Home/User/ResetPassword.jsp");
            } else {
                boolean updated = registerService.updatePassword(email, password);
                if (updated) {
                    try {
                        session.invalidate();
                    } catch (IllegalStateException e) {
                        // Session already invalidated, ignore
                    }
                    req.setAttribute("message", "Password reset successful! You can now login.");
                    dispatcher = req.getRequestDispatcher("/Home/User/Login.jsp");
                } else {
                    req.setAttribute("errorMsg", "Failed to reset password. Please try again.");
                    dispatcher = req.getRequestDispatcher("/Home/User/ResetPassword.jsp");
                }
            }
        }
        dispatcher.forward(req, resp);
    }
}
