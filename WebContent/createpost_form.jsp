<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Create Post</title>
 <script src="js/myjs.js"></script> 
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<style type="text/css">

input[type=submit] {
	margin: 10px;
	height: 30px;
	color: white;
	background-color: green;
	border-radius: 10px;
	width: 150px;
	opacity: 20px;
	background-color: green;
}
</style>
</head>
<body bgcolor="gray">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<% String post_id = request.getParameter("post_id"); %>
	<% String content = request.getParameter("content"); %>
	
	<ul>
	  <li><a href="logout.jsp">Logout</a></li>	  
	  <li><a href="saved.jsp">Saved</a></li>
	  <li><div id="redot"></div><a href="profile.jsp">Profile</a></li>
	  <li><a href="notification.jsp" class="notification">
	  	<span>Notification</span>
  		<span class="badge">3</span>
	  </a></li>
	  <li><a  href="friends.jsp">My Friends</a></li>
	  <li><a href="send_message_form.jsp">Send Message</a></li>
	  <li><a href="inbox.jsp">Inbox</a></li>
	  <li><a class="active" href="createpost_form.jsp">Create Post</a></li>
	  <li><a href="home.jsp">Home</a></li> 
	</ul>
	<p>
	<center>
		<h3 style="font-color: white">Create Post</h3>
		<form action="createpost.jsp" method="post">
			<input type = "hidden" name="post_id" value = "<%= post_id %>">
			<% if(content == null){ %>
				<input type="text" value="" name="content" required="required" placeholder="Write Post here..."> <br />
			<%}else{ %>
				<input type="text" value="<%= content %>" name="content" required="required" placeholder="Write Post here..."> <br />
			<%} %>			
			<%if(content != null){ %>
				<input	type="submit" value="Update">	
			<%}else{ %>
				<input	type="submit" value="Post">
			<%} %>  			
		</form>
	</center>
	</p>
</body>
</html>
<%
	int unread_count = 0;	
	int user_id = (Integer)session.getAttribute("user_id");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
	Statement st = con.createStatement();
	PreparedStatement ps = null;
	ResultSet rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");
	while(rs.next()){unread_count = rs.getInt("count");}
%>

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