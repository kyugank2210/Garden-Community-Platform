package com.gardenconnect.servlet;

import com.gardenconnect.dao.PostDAO;
import com.gardenconnect.model.User;
import com.gardenconnect.service.LikeService;
import com.gardenconnect.service.NotificationService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/posts/like")
public class LikePostServlet extends HttpServlet {
    private final LikeService likes=new LikeService();
    private final PostDAO posts=new PostDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            int postId=Integer.parseInt(req.getParameter("postId"));
            boolean liked=likes.toggleLike(postId,u.getUserId());
            if(liked){
                int owner=posts.getOwnerId(postId);
                if(owner>0 && owner!=u.getUserId())
                    NotificationService.getInstance().enqueue(owner,u.getName()+" liked your post.");
            }
        }catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/posts");
    }
}
