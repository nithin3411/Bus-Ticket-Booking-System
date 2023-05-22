<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Route</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
%>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.jsp");
}
%>
<%!int flag=0; %>
<%
String route_id=request.getParameter("ri");
String from=request.getParameter("fr");
String to=request.getParameter("to");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
String un="root";
String pwd="admin@123";
Connection con=DriverManager.getConnection(url,un,pwd);
//
String sql = "select * from route where src=? and distination=?";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,from);
ps.setString(2,to);


ResultSet rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("src");
userdbPsw = rs.getString("distination");

if(from.equals(userdbName) && to.equals(userdbPsw))
{
	out.println("<script>alert('Route Already Exists');window.location='route.jsp';</script>");
} else
{
	response.sendRedirect("eror.jsp");
	rs.close();
	ps.close(); 	
}
} // end of if
else
{%>


<%
String r_id=request.getParameter("ri");
String  scr=request.getParameter("fr");
String  destination=request.getParameter("to");

//Class.forName("com.mysql.jdbc.Driver");
//String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
//String un="root";
//String pwd="admin@123";
Connection con1=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps1=con1.prepareStatement("insert into route(r_id,src,distination )values(?,?,?)");
ps1.setString(1,r_id);
ps1.setString(2,scr);
ps1.setString(3,destination);

%>
<% 





//CallableStatement st=con.prepareCall("{call new_procedure(?,?,?)}");
//st.setString(1,route_id);
//st.setString(2,from);
//st.setString(3,to);
%>
<% try{%>
 <%flag=ps1.executeUpdate();%>
 <%out.println("<script>alert('Inserted Sucessfully');window.location='preparestmt.jsp';</script>");

%> 
<% }
 catch(Exception e)
{%>
	<%out.println("<script>alert('Not Inserted Sucessfully');window.location='route.jsp';</script>");

%> 
	
<a href="route.jsp">Back</a>

<%} %>
<%} %>

</body>
</html>