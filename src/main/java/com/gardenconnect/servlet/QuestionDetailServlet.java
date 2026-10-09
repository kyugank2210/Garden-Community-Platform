package com.gardenconnect.servlet;

import com.gardenconnect.dao.QuestionDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/questions/view")
public class QuestionDetailServlet extends HttpServlet {
    private final QuestionDAO dao=new QuestionDAO();
    protected void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        try{
            int id=Integer.parseInt(req.getParameter("id"));
            req.setAttribute("question",dao.findById(id));
            req.setAttribute("answers",dao.findAnswers(id));
            req.getRequestDispatcher("/question-detail.jsp").forward(req,res);
        }catch(Exception e){throw new ServletException(e);}
    }
}
