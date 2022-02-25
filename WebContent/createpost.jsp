<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String content = request.getParameter("content");		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();

		System.out.println("in desired condition");
		int i = st.executeUpdate(
				"insert into posts (`created_by`,`content`) VALUES (" + user_id + ",'" + content + "');");
		if (i > 0) {
			response.sendRedirect("home.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>