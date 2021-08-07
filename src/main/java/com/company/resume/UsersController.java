package com.company.resume;

import com.company.bean.User;
import dao.inter.UserDaoInter;
import main.dao.Context;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersController", value = "/users")
public class UsersController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDaoInter userDaoInter = Context.instanceUserDAO();
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String nationalityIDString = request.getParameter("nid");
        Integer nationalityID = null;
        if (nationalityIDString != null && !nationalityIDString.trim().isEmpty()) {
            nationalityID = Integer.parseInt(nationalityIDString);
        }
        List<User> users = userDaoInter.getAll(name, surname, nationalityID);
        try {
            request.setAttribute("users", users);
            request.getRequestDispatcher("users.jsp").forward(request, response);
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + ex.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDaoInter userDaoInter = Context.instanceUserDAO();
        if (request.getParameter("action").equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User u = userDaoInter.getByID(id);
            response.sendRedirect("userdetail?id="+u.getId());
        }
        else if (request.getParameter("action").equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            User u = userDaoInter.getByID(id);
            userDaoInter.removeUser(id);
            response.sendRedirect("users");
        }
    }
}


