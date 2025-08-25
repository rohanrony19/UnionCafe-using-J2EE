package com.xworkz.cafe.servlet;

import com.xworkz.cafe.service.RegisterService;
import com.xworkz.cafe.service.RegisterServiceImpli;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/ForgotPassword")
public class ForgotPassServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ForgotPassword Servlet");

        String email=req.getParameter("email");
        String password = req.getParameter("password");
        String confirmConfirm = req.getParameter("confirmPassword");

        System.out.println("Email: "+email + " " + "Password: " + password +" "+ "ConfirmPassword: "+confirmConfirm);
        RegisterService registerService = new RegisterServiceImpli();
        String result =   registerService.forgotPassword(email,password,confirmConfirm);
        System.out.println(result+"result from forgot password");
        if(!result.equals("validateForgotPassword")){
            if(result.equals("emailError")){
                String emailError = "Please enter valid email";
                req.setAttribute("emailError",emailError);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("ForgotPassword.jsp");
                requestDispatcher.forward(req,resp);
            }
            if(result.equals("passwordError")){
                String passwordError = "password must contain (!@#$%^&*)";
                req.setAttribute("passwordError",passwordError);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("ForgotPassword.jsp");
                requestDispatcher.forward(req,resp);
            }
            if(result.equals("confirmPasswordError")){
                String confirmPasswordError = "Please enter same password";
                req.setAttribute("confirmPasswordError",confirmPasswordError);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("ForgotPassword.jsp");
                requestDispatcher.forward(req,resp);
            }
        }else {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
