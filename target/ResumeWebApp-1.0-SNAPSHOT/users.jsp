<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="main.dao.Context" %>
<%@ page import="com.company.bean.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: elnur
  Date: 8/1/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/6e7a194243.js" crossorigin="anonymous"></script>
<head>
    <title>user jsp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users == null) {
            response.sendRedirect("users");
            return;
        }
    %>
    <div class="container">
        <div>
            <form action="users" method="GET">
                <div class="form-group">
                    <label for="name">name:</label>
                    <input type="text" name="name" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label for="surname">surname:</label>
                    <input type="text" name="surname" value="" class="form-control">
                </div>
                <input type="submit" name="save" value="save" class="btn btn-primary">
            </form>
            <hr>
        </div>
        <div>
            <table class="table">
                <thead>
                <tr>
                    <th>name</th>
                    <th>surname</th>
                    <th>nationality</th>
                </tr>
                </thead>
                <tbody>
                <% for (User u : users) {
                %>
                <tr>
                    <td><%=u.getName()%>
                    </td>
                    <td><%=u.getSurname()%>
                    </td>
                    <td><%=u.getNationality() == null ? "N/A" : u.getNationality()%>
                    </td>
                    <td>
                        <form action="users" method="post">
                            <input type="hidden" name="id" value="<%=u.getId()%>">
                            <button class="btn btn-danger" type="submit" value="delete" name="action">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </form>

                        <form action="users" method="post">
                            <input type="hidden" name="id" value="<%=u.getId()%>">
                            <button class="btn btn-secondary" type="submit" value="update" name="action">
                                <i class="fas fa-pen-square"></i>
                            </button>
                        </form>
                        <button class="btn btn-info " type="submit" class="btn btn-outline-info" value="info"
                                name="action">
                            <i class="fas fa-info"></i>
                        </button>
                    </td>
                </tr>
                </tbody>
                <%}%>
            </table>
        </div>
    </div>
</body>
</html>
