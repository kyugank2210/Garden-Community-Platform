package com.gardenconnect.servlet;

import com.gardenconnect.dao.QuestionDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/questions")
public class QuestionListServlet extends HttpServlet {
    private final QuestionDAO dao=new QuestionDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{req.setAttribute("questions",dao.findAll());req.getRequestDispatcher("/questions.jsp").forward(req,res);}
        catch(Exception e){throw new ServletException(e);}
    }
}
