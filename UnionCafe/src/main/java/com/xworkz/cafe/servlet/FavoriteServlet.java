package com.xworkz.cafe.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddToFavorites")
public class FavoriteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<String[]> favorites = (List<String[]>) session.getAttribute("favorites");
        if (favorites == null) {
            favorites = new ArrayList<>();
        }

        // Read parameters
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("imageUrl");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            favorites.add(new String[]{productName, price, imageUrl});
        } else if ("remove".equals(action)) {
            favorites.removeIf(p -> p[0].equals(productName));
        } else if ("removeAll".equals(action)) {
            favorites.clear(); // ✅ Remove all items at once
        }

        session.setAttribute("favorites", favorites);

        // Redirect back to favorites page
        response.sendRedirect(request.getContextPath() + "/Home/User/favorite.jsp");
    }
}
