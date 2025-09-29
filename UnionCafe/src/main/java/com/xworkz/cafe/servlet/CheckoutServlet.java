package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("cart") == null) {
            response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
            return;
        }

        // Optional: calculate total price
        double total = 0;
        for (CartItem item : cart) {
            total += item.getPrice() * item.getQuantity();
        }

        // Here you can send email confirmation, store order in DB, etc.
        // For now, just clear the cart
        session.removeAttribute("cart");

        // Set success message
        session.setAttribute("checkoutMessage", "Checkout successful! Total: $" + total);

        // Redirect to confirmation page
        response.sendRedirect(request.getContextPath() + "/Home/User/CheckoutSuccess.jsp");
    }
}
