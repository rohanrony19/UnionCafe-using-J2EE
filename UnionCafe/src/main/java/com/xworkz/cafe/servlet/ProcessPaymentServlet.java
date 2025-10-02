package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Home/User/ProcessPayment")
public class ProcessPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("cart") == null) {
            response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
            return;
        }

        String paymentMethod = request.getParameter("paymentMethod");
        String errorMsg = null;

        // Validate payment details based on method
        switch (paymentMethod) {
            case "card":
                String cardNumber = request.getParameter("cardNumber");
                String cardExpiry = request.getParameter("cardExpiry");
                String cardCvv = request.getParameter("cardCvv");

                if (cardNumber == null || cardNumber.trim().isEmpty() || cardNumber.length() != 16) {
                    errorMsg = "Enter a valid 16-digit card number.";
                } else if (cardExpiry == null || cardExpiry.trim().isEmpty()) {
                    errorMsg = "Enter card expiry date.";
                } else if (cardCvv == null || cardCvv.trim().isEmpty() || cardCvv.length() != 3) {
                    errorMsg = "Enter valid 3-digit CVV.";
                }
                break;

            case "upi":
                String upiId = request.getParameter("upiId");
                if (upiId == null || upiId.trim().isEmpty() || !upiId.contains("@")) {
                    errorMsg = "Enter a valid UPI ID.";
                }
                break;

            case "wallet":
                String walletId = request.getParameter("walletId");
                if (walletId == null || walletId.trim().isEmpty()) {
                    errorMsg = "Enter Wallet ID.";
                }
                break;

            case "cod":
                // COD doesn't need extra validation
                break;

            default:
                errorMsg = "Select a payment method.";
        }

        // If error exists, redirect back to payment page with message
        if (errorMsg != null) {
            request.setAttribute("errorMsg", errorMsg);
            request.getRequestDispatcher("/Home/User/Payment.jsp").forward(request, response);
            return;
        }

        // Retrieve cart
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/Home/User/Cart.jsp");
            return;
        }

        // Calculate total amount
        double totalAmount = cart.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();

        // Save payment info and cart for order review page
        session.setAttribute("paymentMethod", paymentMethod);
        session.setAttribute("totalAmount", totalAmount);
        session.setAttribute("cartForOrder", cart);

        // Redirect to order review page
        response.sendRedirect(request.getContextPath() + "/Home/User/OrderReview.jsp");
    }
}
