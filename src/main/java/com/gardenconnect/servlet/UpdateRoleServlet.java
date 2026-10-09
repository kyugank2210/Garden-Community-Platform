package com.gardenconnect.servlet;

import com.gardenconnect.dao.UserDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/role")
public class UpdateRoleServlet extends HttpServlet {
    private final UserDAO dao=new UserDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        User u=(User)req.getSession().getAttribute("user");
        if(!"ADMIN".equalsIgnoreCase(u.getRole())){res.sendError(403);return;}
        try{dao.updateRole(Integer.parseInt(req.getParameter("userId")),req.getParameter("role"));}catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/admin");
    }
}
