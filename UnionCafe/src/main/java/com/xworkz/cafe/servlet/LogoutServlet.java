package com.xworkz.cafe.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Logout")
    public class LogoutServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession(false); // Get existing session
            if (session != null) {
                session.invalidate(); // Invalidate session
            }

            // Forward back to login page with logout message
            req.setAttribute("logoutMessage", "You have successfully logged out.");
            req.getRequestDispatcher("/Home/User/Home.jsp").forward(req, resp);
        }
    }

