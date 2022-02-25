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
	 	String Creater = request.getParameter("creater");	 	
	 	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
	 	int i = st.executeUpdate("insert into likes (`post_id`,`user_id`) VALUES ("+post_id+","+user_id+");");
	 	String msg = (String) session.getAttribute("name")+" Liked Your post"; 
	 	if(user_id != Creater){ // send notification if liker is not creater
	 		i = st.executeUpdate("insert into notifications (`user_id`,`content`) VALUES ("+Creater+",'"+msg+"')");// insert into notification table	
	 	}	 	
	 	if(i>0){
	 		response.sendRedirect("home.jsp");
	 	}else{
	 		response.sendRedirect("error.jsp");
	 	}	 	
 	%>	
</body>
</html>