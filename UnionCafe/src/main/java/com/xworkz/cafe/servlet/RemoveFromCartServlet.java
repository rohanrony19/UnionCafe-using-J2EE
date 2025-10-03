package com.xworkz.cafe.servlet;


import com.xworkz.cafe.dto.CartItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/RemoveFromCart")
    public class RemoveFromCartServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            HttpSession session = req.getSession();
            String productName = req.getParameter("productName");

            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart != null) {
                cart.removeIf(item -> item.getProductName().equals(productName));
                session.setAttribute("cart", cart);
            }

            resp.sendRedirect(req.getContextPath() + "/Home/User/Cart.jsp");
        }
    }

