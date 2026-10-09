package com.gardenconnect.servlet;

import com.gardenconnect.dao.PlantDAO;
import com.gardenconnect.model.User;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/plants/remove")
public class RemovePlantServlet extends HttpServlet {
    private final PlantDAO dao=new PlantDAO();
    protected void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException{
        try{
            User u=(User)req.getSession().getAttribute("user");
            dao.removeFromGarden(Integer.parseInt(req.getParameter("id")),u.getUserId());
        }catch(Exception ignored){}
        res.sendRedirect(req.getContextPath()+"/plants/garden");
    }
}
