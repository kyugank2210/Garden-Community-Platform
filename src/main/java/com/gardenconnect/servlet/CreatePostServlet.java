package com.gardenconnect.servlet;

import com.gardenconnect.dao.PostDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/posts/create")
public class CreatePostServlet extends HttpServlet {
    private final PostDAO dao=new PostDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        String title=req.getParameter("title"), content=req.getParameter("content");
        if(title==null||title.isBlank()||content==null||content.isBlank()){
            res.sendRedirect(req.getContextPath()+"/create-post.jsp?error=Title+and+content+are+required"); return;
        }
        try{
            User u=(User)req.getSession().getAttribute("user");
            dao.create(u.getUserId(),title.trim(),content.trim());
            res.sendRedirect(req.getContextPath()+"/posts");
        }catch(Exception e){res.sendRedirect(req.getContextPath()+"/create-post.jsp?error=Could+not+create+post");}
    }
}
