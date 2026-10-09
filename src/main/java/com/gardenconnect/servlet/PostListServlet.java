package com.gardenconnect.servlet;

import com.gardenconnect.dao.PostDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/posts")
public class PostListServlet extends HttpServlet {
    private final PostDAO dao=new PostDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            req.setAttribute("posts",dao.findAll(u.getUserId()));
            req.getRequestDispatcher("/posts.jsp").forward(req,res);
        }catch(Exception e){ throw new ServletException(e); }
    }
}
