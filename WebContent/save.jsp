<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Like</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
		
	<% 
		String user_id = request.getParameter("id"); 	
	 	String post_id = request.getParameter("post_id");
	 	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
	 	int i = st.executeUpdate("insert into savedposts (`post_id`,`user_id`) VALUES ("+post_id+","+user_id+");");
	 	if(i>0){
	 		response.sendRedirect("home.jsp");
	 	}else{
	 		response.sendRedirect("error.jsp");
	 	}	 	
 	%>
	
</body>
</html>