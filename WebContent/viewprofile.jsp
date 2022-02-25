<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: right;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}
body{
	background-image: url("https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<ul>
		<li><a href="logout.jsp">Logout</a></li>
		<li><a href="saved.jsp">Saved</a></li>
		<li><a href="profile.jsp">Profile</a></li>
		<li><a href="notification.jsp">Notifications</a></li>
		<li><a href="friends.jsp">My Friends</a></li>
		<li><a href="message.jsp">Send Message</a></li>
		<li><a href="message.jsp">Inbox</a></li>
		<li><a href="createpost_form.jsp">Create Post</a></li>
		<li><a href="home.jsp">Home</a></li>
	</ul>
	<center>
		<h1 style="color:white;">
			<%
				out.println("Welcome to " + request.getParameter("name") + "'s Profile");
			%>
		</h1>
	</center>

	<%
		int user_id = (Integer) session.getAttribute("user_id");
		String id = request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		PreparedStatement ps = null;
		ResultSet rs = st.executeQuery("select * from users where id=" + id);
		ResultSet rs1 = st1.executeQuery("select * from friends where user_id="+user_id+" and friend_id="+id);
		String blocked_people = "";
		ResultSet rs2 = st2.executeQuery("select group_concat(user_id) as ids from block where blocked_id="+user_id);
		
		while(rs2.next()){
			blocked_people = rs2.getString("ids");
		}
		
		
		
		int k=0;
		while(rs1.next()){k++;}
		int i = 0;
	%>
	<table align="center" cellpadding="8" cellspacing="4">
		<tr bgcolor="#008000">
			<td><b>userId</b></td>
			<td><b>UserName</b></td>
			<td><b>Email</b></td>
			<td><b></b></td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr bgcolor="#8FBC8F">
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td>			
			<% if (blocked_people!=null && blocked_people.contains(""+rs.getInt("id")+"")){ %>			
					You are Blocked
				<%			
			}else{				
				if(k==0){ %>
				<a href = "addfriend.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Add Friend"></a>
			<%}%>
				<a href = "block_friend.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Block"></a>
		
		<%
			}
			}
		%>
			</td>
		</tr>
	</table>
</body>
</html>

