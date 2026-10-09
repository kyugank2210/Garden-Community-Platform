package com.gardenconnect.servlet;

import com.gardenconnect.dao.UserDAO;
import com.gardenconnect.model.User;
import com.gardenconnect.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDAO dao=new UserDAO();

    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
        String name=req.getParameter("name");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        if(name==null||name.isBlank()||email==null||email.isBlank()||password==null||password.length()<6){
            res.sendRedirect("register.jsp?error=Enter+valid+details.+Password+must+be+6%2B+characters");
            return;
        }
        try{
            if(dao.emailExists(email)){ res.sendRedirect("register.jsp?error=Email+already+registered"); return; }
            User u=new User(0,name.trim(),email.trim(),PasswordUtil.hash(password),"GARDENER");
            dao.register(u);
            res.sendRedirect("login.jsp?registered=true");
        }catch(Exception e){
            res.sendRedirect("register.jsp?error=Registration+failed");
        }
    }
}
