package com.xworkz.cafe.servlet;

import com.xworkz.cafe.service.BookingService;
import com.xworkz.cafe.service.BookingServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Home/User/CancelBooking")
public class CancelBookingServlet extends HttpServlet {

    BookingService service = new BookingServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam != null) {
            try {
                int bookingId = Integer.parseInt(idParam);
                service.deleteBooking(bookingId);
            } catch (NumberFormatException e) {
                // ignore or log
            }
        }
        // Redirect back to MyBooking page
        resp.sendRedirect(req.getContextPath() + "/Home/User/MyBooking");
    }

}

