<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%int i=0; %>
<%String user_id; %>
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">



	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.jsp");
}
%>
<% user_id=(String)session.getAttribute("username");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
String un="root";
String pwd="admin@123";
Connection con=DriverManager.getConnection(url,un,pwd);
%>
<center>
<h1>Ratings</h1>
<%PreparedStatement revt=con.prepareStatement("select * from revi where uname=?");
revt.setString(1,user_id);
ResultSet ts=revt.executeQuery();

%>

</center>
<center>
<p><h3 style="color:brown;"> Ratings</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        Bus ID
      </div>
      <div class="cell">
        Rating Out Of 10
      </div>
      </div>
<%while(ts.next()) {%>
<div class="row">
      <div class="cell" data-title="Bus_ID">
        <%=ts.getString(1) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=ts.getString(3) %>
      </div>
      
</div>
<%i=1; %>

<% }%>
<%if(i==0)
{
	out.println("<script>alert('No Ratings available');window.location='welcome_user.jsp';</script>");
}%>
<!-- css code -->
</div>
</div>
  <style type="text/css">
  
  body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: ;
}
@media screen and (max-width: 580px) {
  body {
    font-size: 16px;
    line-height: 22px;
  }
}

.wrapper {
  margin-left:0px;
  
  padding: 80px;
  max-width: 800px;
}

.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}

.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
@media screen and (max-width: 580px) {
  .row {
    padding: 14px 0 7px;
    display: block;
  }
  .row.header {
    padding: 0;
    height: 6px;
  }
  .row.header .cell {
    display: none;
  }
  .row .cell {
    margin-bottom: 10px;
  }
  .row .cell:before {
    margin-bottom: 3px;
    content: attr(data-title);
    min-width: 98px;
    font-size: 10px;
    line-height: 10px;
    font-weight: bold;
    text-transform: uppercase;
    color: #969696;
    display: block;
  }
}

.cell {
  padding: 6px 12px;
  display: table-cell;
}
@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 16px;
    display: block;
  }
}

</style>
<h3 style="color:white" > <a href="welcome_user.jsp"> Main Menu </a></h3>
</center>
</body>
</html>