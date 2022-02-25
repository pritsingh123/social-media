<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friends</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<style>

	input[type=submit] {
	margin: 10px;
	height: 30px;
	color: white;
	width:200px;
	background-color: green;
	border-radius: 10px;	
	opacity: 20px;	
}
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
	  <li><a class="active" href="friends.jsp">My Friends</a></li>
	  <li><a href="send_message_form.jsp">Send Message</a></li>
	  <li><a href="inbox.jsp">Inbox</a></li>
	  <li><a href="createpost_form.jsp">Create Post</a></li>
	  <li><a  href="home.jsp">Home</a></li> 
	</ul>
	<center><h1><%out.println((String)session.getAttribute("name")+"'s Friendlist");%></h1></center>
	<%
		int user_id = (Integer)session.getAttribute("user_id");
		Class.forName("com.mysql.jdbc.Driver");
		int unread_count=0;
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		String query = request.getParameter("query");
		ResultSet rs;
		if(query != null){
			 rs = st.executeQuery("select users.id,users.name,users.email,friends.created_at from friends inner join users on friends.user_id=users.id where friends.friend_id="+user_id+" and users.name like '%"+query+"%'");
		}else{ 
			 rs = st.executeQuery("select users.id,users.name,users.email,friends.created_at from friends inner join users on friends.user_id=users.id where friends.friend_id="+user_id);
		}
		
		
		 int i=0;  
		 %>
		 <center>
		 	<input type="text" id="search" placeholder="serach..">
		 	<input type="submit" onclick = "search_func()">
		 </center>
		 	<table align="center" cellpadding="12" cellspacing="4">
			<tr>
			
			</tr> 
			<tr bgcolor="#008000">
			
			<td><b>name</b></td>
			<td><b>Email</b></td>
			<td><b>friendship date</b></td>
			<td><b></b></td>
			
			</tr>	
			<% while(rs.next()){
			%>
				<tr bgcolor="#8FBC8F">				
					
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("created_at")%></td>
					<td><a href = "removefriend.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Remove From FriendList"></a></td>	
				</tr>
			<% 
		 }
			
			rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");			
			 while(rs.next()){unread_count = rs.getInt("count");}
			%>
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
function search_func(){
	console.log("ininininni");
	var a =  document.getElementById("search").value;
	window.location.replace("friends.jsp?query="+a);
	console.log(a);
}
</script>
