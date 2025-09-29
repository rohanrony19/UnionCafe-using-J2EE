package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.OrderDto;
import com.xworkz.cafe.service.OrderService;
import com.xworkz.cafe.service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Home/User/MyOrders")
public class MyOrdersServlet extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("mail") == null) {
            resp.sendRedirect(req.getContextPath() + "/Home/User/Login.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("mail");
        List<OrderDto> orders = orderService.getOrdersByUser(userEmail);

        req.setAttribute("orders", orders);  // attach orders
        req.getRequestDispatcher("/Home/User/MyOrders.jsp").forward(req, resp);
    }
}
