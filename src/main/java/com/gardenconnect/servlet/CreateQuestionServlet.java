package com.gardenconnect.servlet;

import com.gardenconnect.dao.QuestionDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/questions/create")
public class CreateQuestionServlet extends HttpServlet {
    private final QuestionDAO dao=new QuestionDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            dao.create(u.getUserId(),req.getParameter("title"),req.getParameter("description"));
        }catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/questions");
    }
}
