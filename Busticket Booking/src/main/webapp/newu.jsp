<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="styles1.css">
   <!-- <link rel="stylesheet" type="text/css" href="styles5.css">  -->
<title>Admin Registration-page</title>
</head>
<body>
<center>
<div class="background">
	<div class="login-box">
	<section>

	<form action="newi.jsp" method="POST">
		<h1>Register form</h1>
		<table>
			<tr>
			<td>
				<p>Name:</p>
			</td>
			     <td>
                   <input type="text" pattern="[A-Za-z\s]{1,32}" placeholder="Name" name="admin_n" required name="">
			    </td>
			</tr>
			  <tr>
			<td>
				<p>Username:</p>
			</td>
			     <td>
                   <input type="text" pattern="[A-Za-z\s]{1,32}" placeholder="username" name="a" required name="">
			    </td>
			</tr>
			<tr>
			<td>
				<p>Password:</p>
			</td>
			     <td>
                   <input type="Password" placeholder="Password" name="password"" required name="">
			    </td>
			</tr>
			<tr>
            
            	<td>
            		<p>Gender:</p>
            	</td>
            	<td>
            	<input type="radio" name="Gender" value="M" required>Male
            	<input type="radio" name="Gender"value="f" required>Female
            </td>

            </tr>
            <tr>
			<td>
				<p>Email:</p>
			</td>
			     <td>
                   <input type="email" placeholder="Email" name="s" required name="">
			    </td>
			</tr>

			<tr>
			<td>
				<p>Phone number:</p>
			</td>
			     <td>
                     <select name="Phone code" required>
                     	
                     	<option value="977">91+</option>
                     	<option value="977">93+</option>
                     	<option value="977">94+</option>
                     	<option value="977">4+</option>
                     	<option value="977">97+</option>
                     	<input type="phone" pattern ="[789][0-9]{9}" placeholder="Phone number" name="m" required name="">
                     </select>
			    </td>
			</tr>
		
			<tr>
				<td>
					<input type="Submit" value="Submit" name="">
					<a href="#">Forget Password</a>  
				</td>

			</tr>
                 
		</table>

	</form>
</section>
</div>

</div>
</center>
</body>
</html>