package com.gardenconnect.servlet;

import com.gardenconnect.dao.UserDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private final UserDAO dao=new UserDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        User u=(User)req.getSession().getAttribute("user");
        if(!"ADMIN".equalsIgnoreCase(u.getRole())){res.sendError(403,"Admin access required.");return;}
        try{req.setAttribute("users",dao.findAll());req.getRequestDispatcher("/admin.jsp").forward(req,res);}
        catch(Exception e){throw new ServletException(e);}
    }
}
