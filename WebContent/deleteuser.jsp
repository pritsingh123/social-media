<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete user</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		int i = st.executeUpdate("update users set status = 0 where id="+user_id);
		if (i > 0) {
			session.removeAttribute("username");
			session.removeAttribute("user_id");
			session.invalidate();		
			response.sendRedirect("index.jsp");		
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>