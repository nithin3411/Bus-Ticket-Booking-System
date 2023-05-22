<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buses ON Various Route</title>
</head>

<body>
<%int i=0; %>
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">



	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<p align="right"><a href="welcome_user.jsp"><input type="submit" class="contact-form-btn" value="User Panel"></a>
</p>
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.jsp");
}
%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus?useSSl=false");
String un="root";
String pwd="admin@123";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps=con.prepareStatement("select b.b_id,b.b_name,b.no_of_seat,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,t.tik_price from bus b,route r,ticket t where b.r_id=r.r_id and b.b_id=t.b_id;");
ResultSet rs=ps.executeQuery();
%>
<center>
<p><h3 style="color:brown;"> Bus Details</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        Bus_ID
      </div>
      <div class="cell">
        Bus name
      </div>
      <div class="cell">
        Seating Capacity 
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
      Fare
      </div>
      <div class="cell">
      Bus Rating
      </div>
          
<div class="cell">
       BOOK Ticket
      </div>  
    </div>


<%while(rs.next()) {%>
    <div class="row">
      <div class="cell" data-title="Bus_ID">
        <%=rs.getString(1) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=rs.getString(2) %>
      </div>
      <div class="cell" data-title="Seating Capacity">
       <%=rs.getString(3) %>
      </div>
 <div class="cell" data-title="Source">
       <%=rs.getString(4) %>
      </div>
 <div class="cell" data-title="Scheduled Arrival">
       <%=rs.getString(5) %>
      </div>
 <div class="cell" data-title="Destination">
       <%=rs.getString(6) %>
      </div>
 <div class="cell" data-title="Scheduled destination">
       <%=rs.getString(7) %>
      </div>
 <div class="cell" data-title="Departure date">
       <%=rs.getString(8) %>
      </div>
 <div class="cell" data-title="Fare">
       <%=rs.getString(9) %>
      </div>
      <div class="cell" data-title="Delete">
       <a href="ratingalluser.jsp?bid=<%=rs.getString(1)%>"><b> Bus Rating</b></a>
      </div>
      <div class="cell" data-title="book">
       <a href="passenger.jsp?bid=<%=rs.getString(1)%>">Book Now</a>
      </div>
    
    </div>
<%i=1; %>

<%}%>

<%if(i==0) 
{
	out.println("<script>alert('Bus Details Not Available');window.location='welcome_user.jsp';</script>");
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