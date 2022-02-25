<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

</head><link rel="stylesheet" type="text/css" href="css/mycss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body bgcolor="gray">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<ul>
	  <li><a href="logout.jsp">Logout</a></li>
	  <li><a href="saved.jsp">Saved</a></li>
	  <li><a class="active" href="profile.jsp">Profile</a></li>
	 <li><a href="notification.jsp" class="notification">
	  	<span>Notification</span>
  		<span class="badge">3</span>
	  </a></li>
	  <li><a href="friends.jsp">My Friends</a></li>
	  <li><a href="send_messsage_form.jsp">Send Message</a></li>
	  <li><a href="inbox.jsp">Inbox</a></li>
	  <li><a href="createpost_form.jsp">Create Post</a></li>
	  <li><a href="home.jsp">Home</a></li> 
	</ul>
	<center><h1><%out.println("Welcome to profile Section  : "+(String)session.getAttribute("name"));%></h1></center>
	
	<%
		int user_id = (Integer)session.getAttribute("user_id");
		int unread_count = 0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		ResultSet rs = st.executeQuery("select * from users where id="+user_id);
		 int i=0;
		 %>
		 	<table align="center" cellpadding="8" cellspacing="4">
			
			<tr bgcolor="#008000">
			
			<td><b>userId</b></td>
			<td><b>UserName</b></td>
			<td><b>Password</b></td>
			<td><b>Email</b></td>
			<td><b>Action</b></td>			
			
			</tr>	
		 <%
		 while(rs.next()){
			 %>
				 <tr bgcolor="#8FBC8F">				
					
					<td><%=rs.getInt("id")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("password")%></td>
					<td><%=rs.getString("email")%></td>
					<td>
							<a href = "deleteuser.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Delete" onclick="return delete1()"></a>
							<a href = "changepassword_form.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Change Password"></a>
							<a href = "clearuserdata.jsp?id=<%=rs.getInt("id")%>"><input type="submit" value= "Clear Account data"></a>
					</td>
					</td>
					</tr>
				 <%}
				 rs = st.executeQuery("select count(*)  as count from notifications where user_id = "+user_id+" and is_recived = 0");			
				 while(rs.next()){unread_count = rs.getInt("count");}				 
				%>
	</table>		
</body>
</html>

<script>
window.onload = function() {
	console.log(<%=unread_count%>);
	if(<%=unread_count%> == 0){
		$('.badge').hide();	
	}else{
		$('.badge').text(<%=unread_count%>);			
	}			
}
</script>