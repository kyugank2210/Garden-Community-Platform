package com.gardenconnect.servlet;

import com.gardenconnect.dao.UserDAO;
import com.gardenconnect.exception.InvalidLoginException;
import com.gardenconnect.util.PasswordUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserDAO dao=new UserDAO();

    protected void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
        try{
            var user=dao.login(req.getParameter("email"),PasswordUtil.hash(req.getParameter("password")));
            HttpSession session=req.getSession(true);
            session.setAttribute("user",user);
            res.sendRedirect("dashboard.jsp");
        }catch(InvalidLoginException e){
            res.sendRedirect("login.jsp?error=Invalid+email+or+password");
        }catch(Exception e){
            res.sendRedirect("login.jsp?error=Database+connection+error");
        }
    }
}
