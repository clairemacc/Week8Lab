package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import models.*;
import services.*;

public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RoleService roleService = new RoleService();
        UserService userService = new UserService();

        //String email = null;
        //String action = request.getParameter("action");

        try {
            //email = request.getParameter("email");

            List<User> users = userService.getAll();
            //List<Role> role = roleService.getAll();

            request.setAttribute("users", users);
           // request.setAttribute("role", role);
        } catch (Exception e) {
            request.setAttribute("message", "error has occur");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Boolean active = true;
        String action = request.getParameter("action");

        //RoleService roleService = new RoleService();
        UserService userService = new UserService();

        try {
            switch (action) {
                case "create":
                    userService.insert(email, active, firstName, lastName, password, role);
                    //roleService.insert(id, name);

                    break;
                case "update":
                    active = Boolean.parseBoolean(request.getParameter("active"));

                    userService.update(email, active, firstName, lastName, password, role);
                    //roleService.update(email, role);

                    break;
                case "delete":
                    active = false;

                    userService.delete(email, active, firstName, lastName, password, role);
                    //roleService.delete(email, role);
                    break;
                case "edit":
                    UserService userServices  = new UserService();
                    List<User> users = userService.getAll();
                    request.setAttribute("users", users);
                    String editEmail = request.getParameter("edit");
                    User user = userService.get(editEmail);
                    request.setAttribute("updateEmail", user.getEmail());
                    request.setAttribute("updateFname", user.getFirstname());
                    request.setAttribute("updateLtname", user.getLastname());
                    request.setAttribute("updatePassword", user.getEmail());
                    request.setAttribute("updateRole", user.getRole());
                    break;
            }

            request.setAttribute("message", action);
        } catch (Exception e) {
            request.setAttribute("message", "error has occur");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp")
                .forward(request, response);
    }
}
