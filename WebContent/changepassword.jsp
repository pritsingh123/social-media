<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
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
		int i = st.executeUpdate("update users set `password`= '"+password+"' where id="+user_id);
		if (i > 0) {
			response.sendRedirect("profile.jsp");		
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>