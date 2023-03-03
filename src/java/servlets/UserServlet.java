/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Role;
import models.User;
import services.RoleService;
import services.UserService;

/**
 *
 * @author Kelsey
 */
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService userS = new UserService();
        RoleService roleS = new RoleService();
        String touch = request.getParameter("action");
        try{
            if(touch != null && touch.equals("edit")){
                String mail = request.getParameter("email");
                User onUser = userS.get(mail);
                request.setAttribute("onUser", onUser);
                request.setAttribute("email",userS.get(mail));
            }else if(touch != null && touch.equals("delete")){
                String mail = request.getParameter("email");
                userS.delete(mail);
                List<User> users = userS.getAll();
                if(users.isEmpty()){
                    request.setAttribute("message", "No users found. Please add a user");
                }
            }
            List<User> users = userS.getAll();
            request.setAttribute("users", users);
            List<Role> roles = roleS.getAll();
            request.setAttribute("roles", roles);
        }catch(Exception ex){
             Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/user.jsp").forward(request,response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       UserService userS = new UserService();
       String touch = request.getParameter("action");
       String mail = request.getParameter("email");
       String firstN = request.getParameter("firstName");
       String lastN = request.getParameter("lastName");
       String uRole = request.getParameter("role");
        Role roles = new Role(uRole);
        
        try{
            if(touch.equals("add")){
                userS.insert(mail, firstN, lastN, roles);
            }
            if(touch.equals("update")){
                userS.insert(mail, firstN, lastN, roles);
            }
            List<User> users = userS.getAll();
            request.setAttribute("users", users);
        }catch(Exception ex){
             Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/user.jsp").forward(request,response);    
    }

 
}
