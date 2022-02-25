<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<style>
input[type=submit] {
	margin: 10px;
	height: 30px;
	color: white;	
	border-radius: 30px;
	width: 70px;
	opacity: 30px;
	background-color: light-black;
}
	
</style>
</head>
<body bgcolor="gray">	
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<ul>
	  <li><a href="logout.jsp">Logout</a></li>
	  <li><a class="active" href="saved.jsp">Saved</a></li>
	  <li><div id="redot"></div><a href="profile.jsp">Profile</a></li>
	  <li><a href="notification.jsp" class="notification">
	  	<span>Notification</span>
  		<span class="badge">3</span>
	  </a></li>
	  <li><a  href="friends.jsp">My Friends</a></li>
	  <li><a href="message.jsp">Send Message</a></li>
	  <li><a href="inbox.jsp">Inbox</a></li>
	  <li><a href="createpost_form.jsp">Create Post</a></li>
	  <li><a href="home.jsp">Home</a></li> 
	</ul>
	<center><h1><%out.println((String)session.getAttribute("name")+"'s saved items");%></h1></center>	
	
	<%
		int user_id = (Integer)session.getAttribute("user_id");
		int unread_count = 0;
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_db", "root", "");
		Statement st = con.createStatement();
		PreparedStatement ps = null;
		ResultSet rs = st.executeQuery("select users.name as user_name,posts.*,likes.user_id as like_user_id,savedposts.user_id as save_user_id from posts inner join users on posts.created_by = users.id left join likes on posts.id=likes.post_id and likes.user_id ="+user_id+ " and likes.status =1 left join savedposts on savedposts.post_id = posts.id and savedposts.user_id = "+user_id+" where posts.deleted = 0 and savedposts.user_id = "+user_id+" order by posts.date desc;");
		 int i=0;
		 %>
		 	<table align="center" cellpadding="8" cellspacing="4">
			
			<tr bgcolor="#008000">
			
			<td><b>Content</b></td>
			<td><b>Date</b></td>
			<td><b>Created_by </b></td>
			<td><b>Action</b></td>
			
			</tr>									
		 <%	
		 while(rs.next()){
			%>
				<tr bgcolor="#8FBC8F">				
					
					<td><%=rs.getString("content")%></td>
					<td><%=rs.getString("date")%></td>
					<% if(rs.getInt("created_by") == user_id){ %>
						<td><a href="profile.jsp" title="view profile">Me</a></td>	
					<%} else{%>
						<td><a href="viewprofile.jsp?id=<%= rs.getInt("created_by")%>&name=<%=rs.getString("user_name")%>" title="view profile"><%=rs.getString("user_name")%></a></td>
					<%} %>	
					
					<td>
					<% if (rs.getString("like_user_id") == null){ %>
						<a href = "like.jsp?id=<%=user_id%>&post_id=<%=rs.getInt("id")%>&creater=<%=rs.getInt("created_by")%>"><input type="submit" value= "like"></a>
					<%}else{ %>
						<a href = "unlike.jsp?id=<%=user_id%>&post_id=<%=rs.getInt("id")%>"><input type="submit" value= "Unlike"></a>
					<%} %>					
						
						<% if (rs.getString("save_user_id") == null){ %>
						<a href = "save.jsp?id=<%=user_id%>&post_id=<%=rs.getInt("id")%>"><input type="submit" value= "save"></a>
					<%}else{ %>
						<a href = "unsave.jsp?id=<%=user_id%>&post_id=<%=rs.getInt("id")%>"><input type="submit" value= "Unsave"></a>
					<%} %>
					
					<% if(rs.getInt("created_by") == user_id){ %>		
							<a href = "delete.jsp?post_id=<%=rs.getInt("id")%>"><input type="submit" value= "Delete"></a>
							<a href = "updatepost_form.jsp?post_id=<%=rs.getInt("id")%>&content=<%=rs.getString("content")%>"><input type="submit" value= "Edit"></a>
							
						<% } %>
						</td>
				</tr>
			<% 
			
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