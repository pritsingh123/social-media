<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Create Post</title>
<style type="text/css">
input[type=text] {
	margin: 10px;
	margin-top: 50px;
	border-color: black;
	border-style: solid;
	margin: 10px;
	height: 40px;
	opacity: 20px;
	width: 400px;
	border-color: black;
	border-style: solid;
	border-radius: 10px;
}
</style>
</head>
<body bgcolor="gray">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
		String post_id = request.getParameter("post_id");
	%>
	<%
		String content = request.getParameter("content");
	%>

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
		<li><a href="inbox.jsp">Inbox</a></li>
		<li><a href="create_post_form.jsp" class="active">Create Post</a></li>
		<li><a href="home.jsp">Home</a></li>
	</ul>
	<p>
	<center>
		<h3 style="font-color: white">Update Post</h3>
		<form action="updatepost.jsp" method="post">
			<input type="hidden" name="post_id" value="<%=post_id%>"> <input
				type="text" value="<%=content%>" name="content"
				required="required" placeholder="Write Post here..."> <br />
			<input type="submit" value="Update">

		</form>
	</center>
	</p>
</body>
</html>

<%
		int user_id = (Integer)session.getAttribute("user_id");
		int unread_count=0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;		
		ResultSet rs;
		rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");
		while(rs.next()){unread_count = rs.getInt("count");}
	%>
<script>
window.onload = function() {
	
	console.log()
	if(<%=unread_count%> == 0){
		$('.badge').hide();	
	}else{
		$('.badge').text(<%=unread_count%>);			
	}			
}
</script>