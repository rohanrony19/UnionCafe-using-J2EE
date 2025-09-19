package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.AdminLoginDTO;
import com.xworkz.cafe.service.AdminServiceImpl;
import com.xworkz.cafe.service.LoginStatus;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Home/Admin/adminLogin")
public class AdminController extends HttpServlet {

    private AdminServiceImpl service = new AdminServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Home/Admin/AdminLogin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        AdminLoginDTO dto = new AdminLoginDTO(email, password);
        LoginStatus status = service.validateLogin(dto);

        if (status == LoginStatus.SUCCESS) {
            // Store admin email in session
            req.getSession().setAttribute("adminEmail", dto.getEmail());
            // Redirect to dashboard (clears previous messages)
            resp.sendRedirect(req.getContextPath() + "/Home/Admin/AdminDashboard.jsp");
        } else {
            String message;
            switch (status) {
                case INVALID_CREDENTIALS:
                    message = "❌ Invalid email or password!";
                    break;
                case ACCOUNT_LOCKED:
                    message = "⚠️ Account locked after 3 failed attempts.";
                    break;
                default:
                    message = "Something went wrong!";
            }
            req.setAttribute("msg", message);
            req.getRequestDispatcher("/Home/Admin/AdminLogin.jsp").forward(req, resp);
        }
    }

}
