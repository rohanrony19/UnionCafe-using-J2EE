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

@WebServlet("/AddAllToCart")
public class AddAllToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Get favorites from session
        List<String[]> favorites = (List<String[]>) session.getAttribute("favorites");
        if (favorites == null || favorites.isEmpty()) {
            // No favorites to add
            response.sendRedirect(request.getContextPath() + "/Home/User/favorite.jsp");
            return;
        }

        // Get or create cart in session
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Add each favorite to cart
        for (String[] product : favorites) {
            String name = product[0];
            double price = Double.parseDouble(product[1]);
            String imageUrl = product[2]; // make sure favorites has imageUrl at index 2

            boolean found = false;
            for (CartItem item : cart) {
                if (item.getProductName().equals(name)) {
                    item.setQuantity(item.getQuantity() + 1); // increase quantity
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(name, price, 1, imageUrl));
            }
        }

        // Save updated cart in session
        session.setAttribute("cart", cart);

        // Redirect to cart page
        response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
    }
}