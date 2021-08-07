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

@WebServlet(name = "UserController", value = "/userdetail")
public class UserDetailController extends HttpServlet {
    private UserDaoInter userDaoInter = Context.instanceUserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        User u = userDaoInter.getByID(id);
        u.setName(name);
        u.setSurname(surname);
        userDaoInter.updateUser(u);
        response.sendRedirect("users");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            Integer id = Integer.parseInt(idStr);

            UserDaoInter userDaoInter = Context.instanceUserDAO();
            Integer userID = Integer.parseInt(request.getParameter("id"));
            User u = userDaoInter.getByID(userID);
            if (u == null) {
                throw new IllegalArgumentException("there is no user with this id");
            }
            request.setAttribute("user", u);
            request.getRequestDispatcher("userdetail.jsp").forward(request, response);
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp?msg=" + ex.getMessage());
        }
    }


}
