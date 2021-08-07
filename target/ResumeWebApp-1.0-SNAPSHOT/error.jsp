<%--
  Created by IntelliJ IDEA.
  User: elnur
  Date: 8/5/2021
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Why are you here?</title>
</head>
<body>
    <% String msg = request.getParameter("msg");%>
    <%= "ERROR OCCURRED "+ msg %>
</body>
</html>
