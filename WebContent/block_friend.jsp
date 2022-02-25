<%@page import="java.nio.file.attribute.UserPrincipal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String f_id = request.getParameter("id"); 
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		int i=0;
		 i = st.executeUpdate("insert into block (user_id,blocked_id) VALUES ("+user_id+","+f_id+")");
		 
		 i = st.executeUpdate("delete from friends where (user_id="+user_id+" and friend_id = "+f_id+") OR (user_id="+f_id+" and friend_id = "+user_id+")");
		 
		 response.sendRedirect("friends.jsp");
		 
		%>
</body>
</html>