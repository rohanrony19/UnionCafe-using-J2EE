package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpli;
//import sun.plugin.dom.core.Element;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/Profile")
public class ProfileServlet extends HttpServlet {
    private RegisterService registerService = new RegisterServiceImpli();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("in profile");
        HttpSession httpSession=req.getSession(false);
        if (httpSession == null || httpSession.getAttribute("mail") == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        String email = (String) httpSession.getAttribute("mail");

        // Call service to fetch details from DB

        RegisterDTO dto = registerService.displayDetailFromEmail(email);

        if (dto == null) {
            // Email not found in DB → force login again
            resp.sendRedirect("Login.jsp");
            return;
        }

        // Set attributes for JSP
        req.setAttribute("fullName", dto.getFullName());
        req.setAttribute("phoneNumber", dto.getPhoneNumber());
        req.setAttribute("email", dto.getEmail());

        RequestDispatcher rd = req.getRequestDispatcher("Profile.jsp");
        rd.forward(req, resp);
    }
}


