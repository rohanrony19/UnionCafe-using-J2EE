package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpl;
//import sun.plugin.dom.core.Element;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(urlPatterns = "/Profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ProfileServlet extends HttpServlet {
        private final RegisterService registerService = new RegisterServiceImpl();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            System.out.println("In Profile Servlet");

            String imageParam = req.getParameter("image");
            if (imageParam != null) {
                File file = new File(getServletContext().getRealPath("/") + imageParam);
                if (file.exists()) {
                    resp.setContentType(getServletContext().getMimeType(file.getName()));
                    Files.copy(file.toPath(), resp.getOutputStream());
                }
                return; // Do not forward to JSP
            }

            HttpSession httpSession = req.getSession(false);
            if (httpSession == null || httpSession.getAttribute("mail") == null) {
                resp.sendRedirect(req.getContextPath() + "/Home/User/Login.jsp");
                return;
            }

            String email = (String) httpSession.getAttribute("mail");

            // Call service to fetch details from DB
            RegisterDTO dto = registerService.displayDetailFromEmail(email);

            if (dto == null) {
                resp.sendRedirect(req.getContextPath() + "/Home/User/Login.jsp");
                return;
            }

            // ✅ Set attributes
            req.setAttribute("fullName", dto.getFullName());
            req.setAttribute("phoneNumber", dto.getPhoneNumber());
            req.setAttribute("email", dto.getEmail());
            req.setAttribute("age", dto.getAge());
            req.setAttribute("address", dto.getAddress());
            req.setAttribute("dto", dto); // for imagePath and future use

            // Forward to JSP
            RequestDispatcher rd = req.getRequestDispatcher("/Home/User/Profile.jsp");
            rd.forward(req, resp);
        }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("mail") == null) {
            resp.sendRedirect(req.getContextPath() + "/Home/User/Login.jsp");
            return;
        }

        String email = (String) session.getAttribute("mail");

        // Get form parameters
        String fullName = req.getParameter("fullName");
        String phoneNumber = req.getParameter("phoneNumber");
        String ageStr = req.getParameter("age");
        String address = req.getParameter("address");

        // Parse age safely
        int age = 0;
        try {
            if (ageStr != null && !ageStr.isBlank()) {
                age = Integer.parseInt(ageStr);
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid age entered: " + ageStr);
        }

        // Handle image upload
        Part filePart = req.getPart("profileImage");
        String imagePath = null;
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

            // Save inside "uploads" folder of your project
            String uploadDir = req.getServletContext().getRealPath("/") + "uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) uploadDirFile.mkdirs();

            filePart.write(uploadDir + File.separator + fileName);
            imagePath = "uploads/" + fileName; // relative path for JSP
        }

        // Create DTO
        RegisterDTO dto = new RegisterDTO();
        dto.setFullName(fullName);
        dto.setPhoneNumber(phoneNumber);
        dto.setAge(age);
        dto.setAddress(address);
        dto.setEmail(email);
        if (imagePath != null) {
            dto.setImagePath(imagePath);
        }

        // ✅ Call service to update
        boolean updated = registerService.updateProfile(dto);

        // Add status message
        if (updated) {
            req.setAttribute("message", "Profile updated successfully!");
            req.setAttribute("messageType", "success"); // green
        } else {
            req.setAttribute("message", "Failed to update profile.");
            req.setAttribute("messageType", "error"); // red
        }


        // Reload profile data (fetch fresh values via doGet)
        doGet(req, resp);
    }

}



