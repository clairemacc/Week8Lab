/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author redma
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RoleService roleService = new RoleService();
        UserService userService = new UserService();
       
        String email = null;
        String action = request.getParameter("action");
       
        try
        {
            email = request.getParameter("email");
           
            List<User> user = userService.getAll(email);
            List<Role> role = roleService.getAll(email);
           
            request.setAttribute("user", user);
            request.setAttribute("role", role);
        }
        catch (Exception e)
        {
            request.setAttribute("message", "error has occur");
        }
       
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        Boolean active = true;
        String action = request.getParameter("action");
       
        RoleService roleService = new RoleService();
        UserService userService = new UserService();
       
        try
        {
            switch (action)
            {
                case "create":
                    userService.insert(email, active, firstName, lastName, password);
                    roleService.insert(email, role);
                   
                    break;
                case "update":
                    active = Boolean.parseBoolean(request.getParameter("active"));
                   
                    userService.update(active, firstName, lastName, password);
                    roleService.update(email, role);
                   
                    break;
                case "delete":
                    active = false;
                   
                    userService.delete(email, active, firstName, lastName, password);
                    roleService.delete(email, role);
            }
           
            request.setAttribute("message", action);
        }
        catch(Exception e)
        {
            request.setAttribute("message", "error has occur");
        }
       
        try
        {
            List<User> user = userService.getAll(email);
            List<Role> role = roleService.getAll(email);
        }
        catch
        {
            request.setAttribute("message", "error has occur");
        }       
    }
}
