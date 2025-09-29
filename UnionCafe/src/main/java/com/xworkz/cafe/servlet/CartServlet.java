package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddToCart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Get product info from form
        String productName = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String imageUrl = req.getParameter("imageUrl"); // new field

        // Get cart from session or create if null
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Check if product already in cart
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProductName().equals(productName)) {
                item.setQuantity(item.getQuantity() + quantity);
                item.setImageUrl(imageUrl);
                found = true;
                break;
            }
        }

        // If not found, add new CartItem with image
        if (!found) {
            cart.add(new CartItem(productName, price, quantity, imageUrl));
        }

        // Save cart in session
        session.setAttribute("cart", cart);

        // Redirect back to cart page
        resp.sendRedirect(req.getContextPath() + "/Home/User/Cart.jsp");
    }
}
