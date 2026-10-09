package com.gardenconnect.servlet;

import com.gardenconnect.dao.PlantDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/plants")
public class PlantLibraryServlet extends HttpServlet {
    private final PlantDAO dao=new PlantDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            req.setAttribute("plants",dao.findAll(req.getParameter("q"),u.getUserId()));
            req.getRequestDispatcher("/plants.jsp").forward(req,res);
        }catch(Exception e){throw new ServletException(e);}
    }
}
