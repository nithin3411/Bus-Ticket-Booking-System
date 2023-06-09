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
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">



	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<%String user_id; %>
<%int i=0; %>
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.jsp");
}
%>
<p align="right"><a href="welcome_user.jsp"><input type="submit" class="contact-form-btn" value="User Panel"></a>
</p>
<%
String tid=request.getParameter("tid");
String bus_id=request.getParameter("bid");
user_id=(String)session.getAttribute("username");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
String un="root";
String pwd="admin@123";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps=con.prepareStatement("select p.p_name,r.b_id,r.ratings from  revi r,passenger p where p.t_id=r.ticket_id and r.uname=? and r.b_id=? and p.t_id=?");
ps.setString(1,user_id);
ps.setString(2,bus_id);
ps.setString(3,tid);
ResultSet rs=ps.executeQuery();
%>

<center>
<p><h3 style="color:brown;"> Passenger Review Details</h3></p>

<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
    
     
      <div class="cell">
        Passenger Name
      </div>
      <div class="cell">
        Bus ID
      </div>
      <div class="cell">
        Rating
      </div>
     
      
    </div>

<%while(rs.next()) {%>


<div class="row">
     <div class="cell" data-title="User ID">
        <%=rs.getString(1) %>
      </div>
      <div class="cell" data-title="Bus ID">
        <%=rs.getString(2) %>
      </div>
      <div class="cell" data-title="Rating">
        <%=rs.getString(3) %>
      </div>
   
      </div>

<%i=1; %>
<%}%>

<%if(i==0) 
{
	out.println("<script>alert('No Ratings Available,Please Give The Rating');window.location='findpass.jsp';</script>");
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
  margin: 0 auto;
  padding: 40px;
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

</center>
</body>
</html>