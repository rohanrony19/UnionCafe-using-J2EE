package com.xworkz.cafe.servlet;

import com.xworkz.cafe.dto.RegisterDTO;
import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpli;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/Register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("running doget in register servlet");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("running dopost in register servlet");
        String fullName = req.getParameter("fullName");
        long phoneNumber = Long.parseLong(req.getParameter("phoneNumber"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
//        System.out.println("FullName: " + fullName + "Email:" + password + "Phone Number: " + email + "Password:" + phoneNumber + "ConfirmPassword:" + confirmPassword);

        System.out.println("RegisterDTO{" +
                "fullName='" + fullName + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                '}');
        RegisterDTO registerDTO = new RegisterDTO();
        registerDTO.setFullName(fullName);
        registerDTO.setPhoneNumber(phoneNumber);
        registerDTO.setEmail(email);
        registerDTO.setPassword(password);
        registerDTO.setConfirmPassword(confirmPassword);

        RegisterService registerService = new RegisterServiceImpli();

        String result = registerService.validate(registerDTO);
        System.out.println("result from service;");
        System.out.println(result);

//        if(result!=null) {
//            if (result.equals("nameError")) {
//                String nameError = "name is not valid";
//                req.setAttribute("nameError", nameError);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                requestDispatcher.forward(req, resp);
//            } if (result.equals("emailError")) {
//                String emailError = "email is not valid ";
//                req.setAttribute("emailError", emailError);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                requestDispatcher.forward(req, resp);
//            }
//            if (result.equals("NumberError")) {
//                String NumberError = "Please Enter Valid Phone Number";
//                req.setAttribute("NumberError", NumberError);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                requestDispatcher.forward(req, resp);
//            }
//            if (result.equals("mailExistError")) {
//                    String mailExistError = "mail already exist";
//                    req.setAttribute("mailExistError", mailExistError);
//                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                    requestDispatcher.forward(req, resp);
//            }
//             if (result.equals("passwordError")) {
//                String passwordError = "password must contain (!@#$%^&*)";
//                req.setAttribute("passwordError", passwordError);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                requestDispatcher.forward(req, resp);
//
//            }  if (result.equals("confirmPasswordError")) {
//                String confirmPasswordError = "password doesn't match";
//                req.setAttribute("confirmPasswordError", confirmPasswordError);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
//                requestDispatcher.forward(req, resp);
//
//            } else {
//                HttpSession session=req.getSession();
//                session.setAttribute("mail",email);
//                session.setAttribute("name",fullName);
//                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Home.jsp");
//                requestDispatcher.forward(req, resp);
//            }
//
//        }
        HttpSession session = req.getSession(false);
        if (result != null) {
            boolean hasError = false;

            if (result.contains("nameError")) {
                req.setAttribute("nameError", "name is not valid");
                hasError = true;
            }
            if (result.contains("emailError")) {
                req.setAttribute("emailError", "email is not valid");
                hasError = true;
            }
            if (result.contains("NumberError")) {
                req.setAttribute("NumberError", "Please Enter Valid Phone Number");
                hasError = true;
            }
            if (result.contains("mailExistError")) {
                req.setAttribute("mailExistError", "mail already exists");
                hasError = true;
            }
            if (result.contains("passwordError")) {
                req.setAttribute("passwordError", "password must contain (!@#$%^&*)");
                hasError = true;
            }
            if (result.contains("confirmPasswordError")) {
                req.setAttribute("confirmPasswordError", "password doesn't match");
                hasError = true;
            }

            if (hasError) {
                // forward only ONCE after all attributes are set
                RequestDispatcher rd = req.getRequestDispatcher("Register.jsp");
                rd.forward(req, resp);
                return; // stop execution
            } else {
                session = req.getSession();
                session.setAttribute("mail", email);
                session.setAttribute("name", fullName);

                RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
                rd.forward(req, resp);
            }
        }


//        switch (result) {
//        case "nameError":
//            req.setAttribute("nameError", "Name must be at least 3 characters long.");
//            forwardToRegister(req, resp);
//            return;
//
//        case "emailError":
//            req.setAttribute("emailError", "Invalid email format.");
//            forwardToRegister(req, resp);
//            return;
//
//        case "passwordError":
//            req.setAttribute("passwordError", "Password must be 8+ characters with letters, digits, special chars.");
//            forwardToRegister(req, resp);
//            return;
//
//        case "confirmPasswordError":
//            req.setAttribute("confirmPasswordError", "Passwords do not match.");
//            forwardToRegister(req, resp);
//            return;
//        default:
//            req.getRequestDispatcher("Home.jsp").forward(req, resp);    }
//}
//    private void forwardToRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher("Register.jsp").forward(req, resp);
//
//    }
//        String Email = req.getParameter("email");
//        RegisterDTO dto = registerService.displayDetailFromEmail(Email);
//
//        session = req.getSession(false);
//        String forwardPage;
//
//        if (dto == null) {
//            req.setAttribute("errorMessage", "Login again");
//            forwardPage = "Login.jsp";
//        } else {
//            req.setAttribute("fullName", dto.getFullName());
//            req.setAttribute("phoneNumber", dto.getPhoneNumber());
//            req.setAttribute("email", dto.getEmail());
//
//            if (session != null && session.getAttribute("mail") != null) {
//                forwardPage = "Profile.jsp";
//            } else {
//                forwardPage = "Login.jsp";
//            }
//        }
//
//        req.getRequestDispatcher(forwardPage).forward(req, resp);
//
//    }
//        System.out.println("in mail");
//        session = req.getSession(false);
//        if (session == null || session.getAttribute("mail") == null) {
//            resp.sendRedirect("Login.jsp");
//            return;
//        }
//
//        String Email = (String) session.getAttribute("mail");
//        RegisterDTO dto = registerService.displayDetailFromEmail(Email);
//
//        if (dto == null) {
//            req.setAttribute("errorMessage", "User not found or email invalid");
//            req.getRequestDispatcher("Login.jsp").forward(req, resp);
//        } else {
//            System.out.println("in profile");
//            req.setAttribute("fullName", dto.getFullName());
//            req.setAttribute("phoneNumber", dto.getPhoneNumber());
//            req.setAttribute("email", dto.getEmail());
////            req.setAttribute("password", dto.getPassword());
//
//            req.getRequestDispatcher("Profile.jsp").forward(req, resp);
//        }

    }
}


