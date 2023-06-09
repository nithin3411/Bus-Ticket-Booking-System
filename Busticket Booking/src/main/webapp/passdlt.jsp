<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancelled Ticket</title>
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
String unam=(String)session.getAttribute("username");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
String un="root";
String pwd="admin@123";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement kt=con.prepareStatement("select t_id,p.b_id,b.b_name,p_name,gender,src,scdl_srcarr,distination,scdl_destarr,dep_date,seat_no,t.tik_price,p.created_on,p.time_ from passdlt p,ticket t,bus b,route r where p.b_id=t.b_id and p.b_id=b.b_id and r.r_id=b.r_id and p.uname=?");
kt.setString(1,unam);
ResultSet rs = kt.executeQuery();
%>
<center>
<p><h3 style="color:brown;"> Cancelled Booking  Details</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        Cancellation Date
      </div>
      <div class="cell">
        Cancellation Time
      </div>
      <div class="cell">
        Ticket Id 
      </div>
      <div class="cell">
      Bus Id 
      </div>
      <div class="cell">
      Bus Name
      </div>
      <div class="cell">
      Passenger Name 
      </div>
      <div class="cell">
      Gender 
      </div>
<div class="cell">
      Source 
      </div>
<div class="cell">
      Scheduled Arrival
      </div>
<div class="cell">
       Distination
      </div>
<div class="cell">
        Destination Arrival 
      </div>
<div class="cell">
        Departure date
      </div>
<div class="cell">
     Seat No
      </div>
          
<div class="cell">
      Fare
      </div> 
    
    </div>

<% while(rs.next()) {%>

<div class="row">
      <div class="cell" data-title="Bus_ID">
        <%=rs.getString(13) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=rs.getString(14) %>
      </div>
      <div class="cell" data-title="Seating Capacity">
       <%=rs.getString(1) %>
      </div>
 <div class="cell" data-title="Source">
       <%=rs.getString(2) %>
      </div>
 <div class="cell" data-title="Scheduled Arrival">
       <%=rs.getString(3) %>
      </div>
 <div class="cell" data-title="Destination">
       <%=rs.getString(4) %>
      </div>
 <div class="cell" data-title="Scheduled destination">
       <%=rs.getString(5) %>
      </div>
 <div class="cell" data-title="Departure date">
       <%=rs.getString(6) %>
      </div>
 <div class="cell" data-title="Fare">
       <%=rs.getString(7) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(8) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(9) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(10) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(11) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(12) %>
      </div>
</div>

<%i=1; %>
<%}%>
<%if(i==0) 
{
	out.println("<script>alert('No Ticket Has Been Cancelled Till Now');window.location='welcome_user.jsp';</script>");
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
  margin-left:-450px;
  
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
.contact-form-btn {
    float: center;
    border: 0;
    background: #34495e;
    color: #fff;
    padding: 12px 50px;
    border-radius: 20px;
    cursor: pointer;
    transition: 0.5s;
}


</style>

</center>

</body>
</html>