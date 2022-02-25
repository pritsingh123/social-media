<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove Friend</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		int i = st.executeUpdate("delete from friends where (user_id = "+user_id+" and friend_id="+id+") or (user_id = "+id+" and friend_id="+user_id+")");
		if (i > 0) {				
			response.sendRedirect("friends.jsp");		
		} else {
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>