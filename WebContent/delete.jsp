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
	 	String post_id = request.getParameter("post_id");
	 	Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
	 	int i = st.executeUpdate("update posts set deleted = 1 where id = "+post_id);
	 	if(i>0){
	 		response.sendRedirect("home.jsp");
	 	}else{
	 		response.sendRedirect("error.jsp");
	 	}	 	
 	%>
</body>
</html>