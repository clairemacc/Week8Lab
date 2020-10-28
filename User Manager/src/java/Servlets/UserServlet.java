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

        RoleService roleService = new RoleService();
        UserService userService = new UserService();

        String email = null;
        String action = request.getParameter("action");

        try {
            email = request.getParameter("email");

            List<User> user = userService.getAll();
            List<Role> role = roleService.getAll();

            request.setAttribute("user", user);
            request.setAttribute("role", role);
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
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        Boolean active = true;
        String action = request.getParameter("action");

        RoleService roleService = new RoleService();
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
                    List<User> user = userService.getAll();
                    request.setAttribute("user", user);
                    break;
            }

            request.setAttribute("message", action);
        } catch (Exception e) {
            request.setAttribute("message", "error has occur");
        }

    }
}
