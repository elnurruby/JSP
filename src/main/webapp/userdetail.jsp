<%@ page import="dao.inter.UserDaoInter" %>
<%@ page import="main.dao.Context" %>
<%@ page import="com.company.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: elnur
  Date: 8/1/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user jsp</title>
</head>
<body>
    <%
        User u = (User)request.getAttribute("user");
    %>

    <div>
        <form action="userdetail" method="post">
            <label for="name">name:</label>
            <input type="hidden" name="id" value="<%=u.getId()%>">
            <input type="text" name="name" value="<%=u.getName()%>">
            <br/>
            <label for="surname">surname</label>
            <input type="text" name="surname" value="<%=u.getSurname()%>">
            <input type="submit" name="save" value="save">
        </form>
    </div>

</body>
</html>
