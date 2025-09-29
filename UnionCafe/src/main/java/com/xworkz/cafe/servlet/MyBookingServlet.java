package com.xworkz.cafe.servlet;

import com.xworkz.cafe.service.BookingService;
import com.xworkz.cafe.service.BookingServiceImpl;
import com.xworkz.cafe.dto.BookingDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Home/User/MyBooking")
public class MyBookingServlet extends HttpServlet {
    private BookingService service = new BookingServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("mail") == null) {
            resp.sendRedirect(req.getContextPath() + "/Home/User/Login.jsp");
            return;
        }

        String email = (String) session.getAttribute("mail");
        List<BookingDto> bookings = service.getBookingsByUser(email);

        req.setAttribute("bookings", bookings);
        req.getRequestDispatcher("/Home/User/MyBooking.jsp").forward(req, resp);
    }
}
