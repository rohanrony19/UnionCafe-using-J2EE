package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.BookingDto;
import com.xworkz.cafe.service.BookingService;
import com.xworkz.cafe.service.BookingServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet(urlPatterns = "/Home/User/booking")
public class BookingHomeServlet  extends HttpServlet {

        private BookingService service = new BookingServiceImpl();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/Home/User/Home.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("mail") == null) {
                response.sendRedirect(request.getContextPath() + "/Home/User/Login.jsp");
                return;
            }

            String email = (String) session.getAttribute("mail");
            String name = request.getParameter("name");
            String phone = request.getParameter("phoneNumber");
            String dateStr = request.getParameter("checkInDate");
            String timeStr = request.getParameter("checkInTime");
            String guestsStr = request.getParameter("numberOfGuests");

            boolean hasError = false;

            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("nameError", "Name is required.");
                hasError = true;
            }
            if (phone == null || !phone.matches("\\d{10}")) {
                request.setAttribute("phoneError", "Enter a valid 10-digit phone number.");
                hasError = true;
            }

            LocalDate date = null;
            try {
                date = LocalDate.parse(dateStr);
                if (date.isBefore(LocalDate.now())) {
                    request.setAttribute("dateError", "Check-in date cannot be in the past.");
                    hasError = true;
                }
            } catch (Exception e) {
                request.setAttribute("dateError", "Invalid check-in date.");
                hasError = true;
            }

            LocalTime time = null;
            try {
                time = LocalTime.parse(timeStr);
                if (time.isBefore(LocalTime.of(10,0)) || time.isAfter(LocalTime.of(22,0))) {
                    request.setAttribute("timeError", "Check-in time must be between 10:00 and 22:00.");
                    hasError = true;
                }
            } catch (Exception e) {
                request.setAttribute("timeError", "Invalid check-in time.");
                hasError = true;
            }

            int guests = 0;
            try {
                guests = Integer.parseInt(guestsStr);
                if (guests <1 || guests >20) {
                    request.setAttribute("guestsError", "Number of guests must be between 1 and 20.");
                    hasError = true;
                }
            } catch(Exception e) {
                request.setAttribute("guestsError", "Invalid number of guests.");
                hasError = true;
            }

            if (!hasError && service.existsBookingForEmailAndDate(email, date)) {
                request.setAttribute("duplicateError", "You have already booked for this date.");
                hasError = true;
            }

            if(hasError) {
                request.setAttribute("nameValue", name);
                request.setAttribute("phoneValue", phone);
                request.setAttribute("dateValue", dateStr);
                request.setAttribute("timeValue", timeStr);
                request.setAttribute("guestsValue", guestsStr);
                request.getRequestDispatcher("/Home/User/Home.jsp").forward(request, response);
                return;
            }

            BookingDto dto = new BookingDto(0, name.trim(), email.trim(), phone.trim(), date, time, guests);
            boolean saved = service.saveBooking(dto);

            if (saved) {
                // store success message in session to show once after redirect
                session.setAttribute("success", "Booking successful!");
                // redirect to servlet URL that loads bookings list and forwards to JSP
                response.sendRedirect(request.getContextPath() + "/Home/User/MyBooking");
            } else {
                request.setAttribute("error", "Booking failed. Please try again.");
                request.getRequestDispatcher("/Home/User/Home.jsp").forward(request, response);
            }

        }
    }
