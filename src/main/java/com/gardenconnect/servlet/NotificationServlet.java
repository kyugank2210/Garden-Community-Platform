package com.gardenconnect.servlet;

import com.gardenconnect.dao.NotificationDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/notifications")
public class NotificationServlet extends HttpServlet {
    private final NotificationDAO dao=new NotificationDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            req.setAttribute("notifications",dao.findByUser(u.getUserId()));
            dao.markAllRead(u.getUserId());
            req.getRequestDispatcher("/notifications.jsp").forward(req,res);
        }catch(Exception e){throw new ServletException(e);}
    }
}
