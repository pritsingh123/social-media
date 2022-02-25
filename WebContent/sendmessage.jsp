<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send message</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String user = request.getParameter("users");
		String message = request.getParameter("message");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();		
		int sentflag = 0;
		ResultSet rs = st.executeQuery("select group_concat(user_id) as ids from block where blocked_id="+user_id);		
		while(rs.next()){
			System.out.println("values==========="+rs.getString("ids")+" and message like========"+""+user_id+"");
			if(rs.getString("ids").contains(""+user+"")){
				
			}else{
				sentflag = 1;		
			}		
		}		
		if(sentflag>0){
			int i = st.executeUpdate("insert into message (`from`,`to`,`message`) VALUES ("+user_id+","+user+",'"+message+"')");// insert into message table
			String msg = "New message from "+(String) session.getAttribute("name")+" : "+message;
			i = st.executeUpdate("insert into notifications (`user_id`,`content`) VALUES ("+user+",'"+msg+"')");// insert into notification table
			if (i > 0) {
				response.sendRedirect("home.jsp");
			} else {
				response.sendRedirect("error.jsp");
			}
		}else{
			response.sendRedirect("home.jsp");
		}
	%>
</body>
</html>