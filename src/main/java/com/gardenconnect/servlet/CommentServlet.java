package com.gardenconnect.servlet;

import com.gardenconnect.dao.CommentDAO;
import com.gardenconnect.dao.PostDAO;
import com.gardenconnect.model.User;
import com.gardenconnect.service.NotificationService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/posts/comment")
public class CommentServlet extends HttpServlet {
    private final CommentDAO comments=new CommentDAO();
    private final PostDAO posts=new PostDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        int postId=Integer.parseInt(req.getParameter("postId"));
        String text=req.getParameter("comment");
        try{
            User u=(User)req.getSession().getAttribute("user");
            if(text==null||text.isBlank()){res.sendRedirect(req.getContextPath()+"/posts");return;}
            comments.create(postId,u.getUserId(),text.trim());
            int owner=posts.getOwnerId(postId);
            if(owner>0&&owner!=u.getUserId())
                NotificationService.getInstance().enqueue(owner,u.getName()+" commented on your post.");
        }catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/posts");
    }
}
