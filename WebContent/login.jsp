<%@page import="sun.invoke.empty.Empty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="white">	
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
	<a style="float:right;height:30px;width:60px;background-color:gray;color:black;" href = "logout.jsp"> Logout </a>
 <% String name = request.getParameter("username"); 	
 	String password = request.getParameter("password"); 
 	String email = request.getParameter("email");
 	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
	Statement st = con.createStatement();
	 PreparedStatement ps = null;  
	 
	 if(email == null){ //login code
		 ResultSet rs = st.executeQuery("select * from users where name ='"+name+"' and password = '"+password+"' and status = 1");
		 int i=0;
		 int user_id=0;
		 while(rs.next()){
			 user_id = rs.getInt("id");
			 i++;
		 }
		 if(i>0){
			 // success user found go to home page
			session.setAttribute("name",name);
			session.setAttribute("user_id",user_id);
			response.sendRedirect("home.jsp");
		 }else{
			%> <h1> No record Found for this user</h1>  <% 
			 out.println("soory ");
		 }
	 }else{ //  sign up code
		 
		int i = st.executeUpdate("insert into users (name,email,password) VALUES ('"+name+"','"+email+"','"+password+"')");
	 	if(i>0){
	 		session.setAttribute("name",name);
	 		response.sendRedirect("login_form.jsp");
	 		%><center><h1><%out.println("Welcome  : "+(String)session.getAttribute("name"));%></h1></center><%
	 	}else{
	 		out.println("bad");
	 	}
	 }	 
 	%>
</body>
</html>