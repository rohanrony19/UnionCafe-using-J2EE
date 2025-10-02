package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.CartItem;
import com.xworkz.cafe.service.OrderService;
import com.xworkz.cafe.service.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Home/User/PlaceOrder")
public class PlaceOrderServlet extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("cartForOrder") == null || session.getAttribute("mail") == null) {
            response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
            return;
        }

        String userEmail = (String) session.getAttribute("mail");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cartForOrder");
        String paymentMethod = (String) session.getAttribute("paymentMethod");

        boolean success = orderService.placeOrder(cart, userEmail, paymentMethod);

        if (success) {
            // Clear session cart after placing order
            session.removeAttribute("cart");
            session.removeAttribute("cartForOrder");
            session.removeAttribute("totalAmount");
            session.removeAttribute("paymentMethod");

            // Pass info to success page
            request.setAttribute("cart", cart);
            request.setAttribute("paymentMethod", paymentMethod);

            request.getRequestDispatcher("/Home/User/OrderSuccess.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "Failed to place order. Try again.");
            request.getRequestDispatcher("/Home/User/Cart.jsp").forward(request, response);
        }
    }
}
