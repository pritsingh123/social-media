<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link rel="stylesheet" type="text/css" href="css/mycss.css">
<meta charset="UTF-8">
<title>Inbox</title>
<style>

</style>
</head>
<body bgcolor="gray">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<ul>
	  <li><a href="logout.jsp">Logout</a></li>
	  <li><a href="saved.jsp">Saved</a></li>
	  <li><a href="profile.jsp">Profile</a></li>
	  <li><a href="notification.jsp" class="notification">
	  	<span>Notification</span>
  		<span class="badge">3</span>
	  </a></li>
	  <li><a href="friends.jsp">My Friends</a></li>
	  <li><a href="send_message_form.jsp">Send Message</a></li>
	  <li><a class="active" href="inbox.jsp">Inbox</a></li>
	  <li><a href="createpost_form.jsp">Create Post</a></li>
	  <li><a  href="home.jsp">Home</a></li> 
	</ul>
	<center><h1><%out.println((String)session.getAttribute("name")+"'s Inbox");%></h1></center>
	
	<%
		int user_id = (Integer)session.getAttribute("user_id");
		int unread_count = 0;		
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		String query = request.getParameter("query");
		ResultSet rs;
		rs = st.executeQuery("select * from message inner join users on users.id=message.`from` where `to`="+user_id);
		int i =0;
		%>
			<table align="center" cellpadding="20" cellspacing="4">			
			<tr bgcolor="#008000">			
			<td><b>From</b></td>
			<td><b>Message</b></td>
			<td><b>Date Time</b></td>			
			</tr>
		<%
		while(rs.next()){
			%>
			<tr bgcolor="#8FBC8F">							
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("message")%></td>
				<td><%=rs.getString("date")%></td>					
			</tr>
		<% 
			i++;
		}
		if(i==0){
			%> <center><h1> No Data in your inbox :(</h1></center> <%					
		}		
		
		rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");			
		 while(rs.next()){unread_count = rs.getInt("count");}
	%>
	</table>
	
</body>
</html>
<script>
window.onload = function() {
		console.log("nana");
		if(<%=unread_count%> == 0){
			$('.badge').hide();	
		}else{
			$('.badge').text(<%=unread_count%>);			
		}	
	}
</script>
