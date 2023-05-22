<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Meassage</title>
</head>
<body>
<center><p style="color:red">Sorry, your record is not available.</p></center>
<%
getServletContext().getRequestDispatcher("/Start_bus.jsp").include(request, response);

%>
</body>
</html>