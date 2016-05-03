<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
</head>
<body>
<table>
<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Username</th></tr>
<c:forEach items="${users}" var="user">
<tr>
  <td>${user.user_id}</td>
  <td>${user.firstname}</td>
  <td>${user.lastname}</td>
  <td>${user.username}</td>
  
</tr>
</c:forEach>
</table>
</body>
</html>



