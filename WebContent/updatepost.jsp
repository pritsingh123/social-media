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
		int user_id = (Integer)session.getAttribute("user_id");		 	
	 	String content = request.getParameter("content");
	 	String post_id = request.getParameter("post_id");
	 	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		System.out.println(content);
		System.out.println("in desired condition no"+post_id);
		int i = st.executeUpdate("update posts set content='"+content+"' where id = "+post_id);
	 	if(i>0){
	 		response.sendRedirect("home.jsp");
	 	}else{
	 		response.sendRedirect("error.jsp");
	 	}	 
		%>
</body>
</html>