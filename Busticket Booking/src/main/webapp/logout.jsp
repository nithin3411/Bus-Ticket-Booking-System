<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
<% session.invalidate(); %>
<% out.println("<script>alert('Successfully logged out');window.location='Start_bus.jsp';</script>");
%>


</body>
</html>