<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Inbox</title>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
</head>
<body bgcolor="gray">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<ul>
	  <li><a href="logout.jsp">Logout</a></li>
	  <li><a href="saved.jsp">Saved</a></li>
	  <li><a href="profile.jsp">Profile</a></li>
	  <li><a class="active" href="notification.jsp" class="notification">
	  	<span>Notification</span>  		
	  </a></li>
	  <li><a  href="friends.jsp">My Friends</a></li>
	  <li><a href="send_message_form.jsp">Send Message</a></li>
	  <li><a href="inbox.jsp">Inbox</a></li>
	  <li><a href="createpost_form.jsp">Create Post</a></li>
	  <li><a  href="home.jsp">Home</a></li> 
	</ul>
	<center><h1><%out.println((String)session.getAttribute("name")+"'s Notification Center");%></h1></center>
	
	<%
		int user_id = (Integer)session.getAttribute("user_id");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		String query = request.getParameter("query");
		ResultSet rs;
		rs = st.executeQuery("select * from notifications where user_id = "+user_id+" order by id desc");
		int i =0;
		int unreadCount = 0;
		%>
			<table align="center" cellpadding="12" cellspacing="4">
			
			<tr bgcolor="#008000">
			
			<td><b>Notification</b></td>
			<td><b>Date</b></td>
			</tr>
		<%
		while(rs.next()){
			
			if(rs.getInt("is_recived") == 0){
				unreadCount++;
				%><tr bgcolor="#23542c"><%
			}else{
				%><tr bgcolor="#8FBC8F"><%
			}
			%>		
				<td><%=rs.getString("content")%></td>
				<td><%=rs.getString("created_at")%></td>
									
			</tr>
		<% 
			i++;	
		}
		if(i==0){
			%> <center><h1> No Data in your Notification Center :(</h1></center> <%
		}		
	%>
	</table>
	
	<%  i = st.executeUpdate("update notifications set is_recived = 1 where user_id="+user_id); %>	

</body>
</html>

