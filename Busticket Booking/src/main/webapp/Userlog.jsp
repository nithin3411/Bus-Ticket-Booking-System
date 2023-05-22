<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user login page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>

<link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Transparent Login Form Design </title>
    <!-- <link rel="stylesheet" type="text/css" href="css/styless.css">-->
       <link rel="stylesheet" type="text/css" href="styless.css">   
</head>
    <body>
    <div id='cssmenu'>
<ul>
   <li class='active'><a href='Start_bus.jsp'>Home</a></li>
   <li><a href='Admin.jsp'>Admin Login</a></li>
   <li><a href='Userlog.jsp'>User Login</a></li>
  
</ul>
</div>
    <div class="login-box">
    <img src="avatar.png" class="avatar">
        <h1>User Login </h1>
            <form action="loginchkuser.jsp">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username" required>
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password"required >
            <input type="submit" name="submit" value="Login">
            <label class="custom-control fill-checkbox mb-0 d-inline-block">

            
 <a href="new_user.jsp">Register</a>   
 
            </form>
        
        
        </div>
    
    </body>
</html>