<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
%>
<%
String uname=request.getParameter("username");
String upass=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?useSSl=false","root","admin@123");

String sql = "select * from login_admin where uname=? and password=?";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,uname);
ps.setString(2,upass);

ResultSet rs = ps.executeQuery();


if(rs.next())
{ 
userdbName = rs.getString("uname");
userdbPsw = rs.getString("password");

if(uname.equals(userdbName) && upass.equals(userdbPsw))
{
session.setAttribute("name",userdbName);

response.sendRedirect("welcomeadmin.jsp"); 
} else
{
	response.sendRedirect("eror.jsp");
	rs.close();
	ps.close(); 	
}
} // end of if
else
{%>
<center>
<p> USERNAME OR PASSWORD IS INCORRECT</p>
<a href="Admin.jsp"> BACK </a>
</center>
<% 
}
%>

</body>
</html>