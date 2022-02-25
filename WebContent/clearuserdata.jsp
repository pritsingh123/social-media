<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clear User Data</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String password = request.getParameter("password"); 
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		int i=0;
		 i = st.executeUpdate("delete from posts where created_by = "+user_id); // delete all post
		 i = st.executeUpdate("delete from likes where user_id = "+user_id); // delete all likes
		 i = st.executeUpdate("delete from savedposts where user_id = "+user_id); // delete all savedcontent
		// i = st.executeUpdate("delete from friends where user_id = "+user_id); // delete all friends
		 //i = st.executeUpdate("delete from notifications where user_id = "+user_id); // delete all notifications
		
			response.sendRedirect("profile.jsp");		
		
	%>
</body>
</html>