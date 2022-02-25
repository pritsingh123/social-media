<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send Message</title>
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

input[type=text] {
	margin: 10px;
	margin-top: 40px;
	border-color: black;
	border-style: solid;
	/*margin-left: 560px;*/
	height: 30px;
	opacity: 20px;
	width: 400px;
	border-color: black;
	border-style: solid;
	border-radius: 10px;
}

select {
	width: 400px;
	height: 40px;
	margin-top: 50px;
	border-radius: 10px;
}
</style>
</head>
<body bgcolor="gray">

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>

	<ul>
		<li><a href="logout.jsp">Logout</a></li>
		<li><a href="saved.jsp">Saved</a></li>
		<li><a  href="profile.jsp">Profile</a></li>
		 <li><a href="notification.jsp" class="notification">
	  	<span>Notification</span>
  		<span class="badge">3</span>
	  </a></li>
		<li><a href="friends.jsp">My Friends</a></li>
		<li><a class="active" href="send_message_form.jsp">Send Message</a></li>
		<li><a href="message.jsp">Inbox</a></li>
		<li><a href="createpost_form.jsp">Create Post</a></li>
		<li><a href="home.jsp">Home</a></li>
	</ul>
	<%
		int user_id = (Integer) session.getAttribute("user_id");
		int unread_count = 0;
		String email = request.getParameter("email");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		ResultSet rs = st.executeQuery("select id,name from users where id !="+user_id);
		int i = 0;
	%>
	<center><h2> Send Message </h2></center>
	<form action="sendmessage.jsp" method="post">
		<center>
			<div class="dropdown">
				<select name="users" required="required">
					<option value="">Select User</option>
					<%
						while (rs.next()) {
					%>
					<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
					<%
						}
					%>
				</select>
			</div>
			<input type="text" value="" name="message" required="required"
				placeholder="Enter Message"> <br>
			<input type="submit" value="Send Message">
		</center>
	</form>
</body>
</html>
<%rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");			
while(rs.next()){unread_count = rs.getInt("count");} %>



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