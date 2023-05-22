package uniquedevloper;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/newregistor")
public class Registrationform extends HttpServlet
{
	private static final long serialVersionUID = 1L;    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// HttpSession session = request.getSession(true);	
		 Date date = new Date();
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String formattedDate = dateFormat.format(date);

		
		 
		String Name= request.getParameter("user_n");
		String UserName = request.getParameter("username");
		String pwd = request.getParameter("password");
		String gender = request.getParameter("Gender");
		String Email = request.getParameter("email");			
		String mobile = request.getParameter("contact");
		
	
		//String dateString = sdf.format(date);	
		RequestDispatcher dispatcher = null;
		Connection con = null;
	
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?useSSl=false","root","admin@123");
			PreparedStatement pst = con.prepareStatement("insert into register(Name,username,password,gender,email,phone_no)values(?,?,?,?,?,?)");
			pst.setString(1,Name);
			pst.setString(2,UserName);
			pst.setString(3,pwd);
			pst.setString(4,gender);
			pst.setString(5,Email);
			pst.setString(6,mobile);
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("Admin.jsp");
			if (rowCount > 0) 
			{
			// request.setAttribute("status", "success"); 			  			
			}
			else
			{
				//request.setAttribute("status", "failed");
			}			
			dispatcher.forward(request,response);
			
		 }
		 catch(Exception e)
		 {
		  e.printStackTrace();		
		 }
		
	  }

	}
