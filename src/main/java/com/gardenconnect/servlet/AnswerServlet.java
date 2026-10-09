package com.gardenconnect.servlet;

import com.gardenconnect.dao.QuestionDAO;
import com.gardenconnect.model.User;
import com.gardenconnect.service.NotificationService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/questions/answer")
public class AnswerServlet extends HttpServlet {
    private final QuestionDAO dao=new QuestionDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        int id=Integer.parseInt(req.getParameter("questionId"));
        try{
            User u=(User)req.getSession().getAttribute("user");
            String answer=req.getParameter("answer");
            if(answer!=null&&!answer.isBlank()){
                dao.addAnswer(id,u.getUserId(),answer.trim());
                int owner=dao.getOwnerId(id);
                if(owner>0&&owner!=u.getUserId())
                    NotificationService.getInstance().enqueue(owner,u.getName()+" answered your question.");
            }
        }catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/questions/view?id="+id);
    }
}
