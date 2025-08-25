package com.xworkz.Bakery.servlet;
import com.xworkz.Bakery.service.RegisterService;
import com.xworkz.Bakery.service.RegisterServiceImpli;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("running post method in Login");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println("Email: " + email +"/n"+ "Password: " + password);

        RegisterService registerService=new RegisterServiceImpli();

       String result = registerService.loginValidation(email,password);
        System.out.println(result);
        if(!result.equals("validData")) {

            if (result.equals("emailError")) {
                String emailError = "Email doesn't exist";
                req.setAttribute("emailError", emailError);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
                requestDispatcher.forward(req, resp);
            }
            if (result.equals("PasswordError")) {
                System.out.println("invalid passs");
                String PasswordError = "Incorrect Password";
                req.setAttribute("PasswordError", PasswordError);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
                requestDispatcher.forward(req, resp);
            }
        }else {
            HttpSession session=req.getSession();
            session.setAttribute("mail",email);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Home.jsp");
            requestDispatcher.forward(req,resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Login.jsp");
        requestDispatcher.forward(req, resp);
    }
}
