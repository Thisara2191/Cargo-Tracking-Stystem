package com.cargosys.app.web.servlets;

import com.cargosys.app.ejb.entity.User;
import com.cargosys.app.ejb.enums.UserType;
import com.cargosys.app.ejb.remote.AuthService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;

@WebServlet("/login")
public class Login extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.cargosys.app-ejb-1.0/AuthServiceBean")
    private AuthService authService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User currentUser = authService.authentication(req.getParameter("username"), req.getParameter("password"));

        if (currentUser != null) {

            String userType = currentUser.getUser_type();
            HttpSession session = req.getSession();
            session.setAttribute("loggedUser",currentUser);

            if (userType.equalsIgnoreCase(UserType.superadmin.name())) {
                req.login("superadmin", "admin1234");
            } else if (userType.equalsIgnoreCase(UserType.admin.name())) {
                req.login("admin", "admin1234");
            } else if (userType.equalsIgnoreCase(UserType.user.name())) {
                req.login("user", "user1234");
            } else {
            }
            resp.sendRedirect(req.getContextPath()+"/admin_console");
        } else {
            resp.sendRedirect("index.jsp");
        }

    }


}
