package com.gardenconnect.filter;

import com.gardenconnect.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter(urlPatterns = {"/dashboard.jsp","/posts/*","/plants/*","/questions/*","/notifications/*","/admin/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse res=(HttpServletResponse)response;
        User user=(User)req.getSession().getAttribute("user");
        if(user==null){
            res.sendRedirect(req.getContextPath()+"/login.jsp?error=Please+login+first");
            return;
        }
        chain.doFilter(request,response);
    }
}
