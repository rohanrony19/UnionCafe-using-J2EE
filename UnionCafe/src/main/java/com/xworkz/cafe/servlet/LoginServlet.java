package com.xworkz.cafe.servlet;
import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/Home/User/Login")
public class LoginServlet extends HttpServlet {

    RegisterService service = new RegisterServiceImpl();

    // Show login page
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/Home/User/Login.jsp").forward(req, resp);
    }

    // Handle login form submission
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        boolean hasError = false;

        // Validation for empty email
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("emailError", "Email is required.");
            hasError = true;
        }

        // Validation for empty password
        if (password == null || password.trim().isEmpty()) {
            req.setAttribute("passwordError", "Password is required.");
            hasError = true;
        }

        // If form validation fails, return to Login.jsp
        if (hasError) {
            req.getRequestDispatcher("/Home/User/Login.jsp").forward(req, resp);
            return;
        }

        // If input filled, check login
        boolean loginSuccess = service.login(email, password);

        if (loginSuccess) {
            // Create session
            HttpSession session = req.getSession();
            session.setAttribute("userEmail", email);

            // Forward to home page
            req.getRequestDispatcher("/Home/User/Home.jsp").forward(req, resp);
        } else {
            // Wrong credentials
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("/Home/User/Login.jsp").forward(req, resp);
        }
    }

}


