<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>my first page</title>
<style>
input[type=email] {
	margin: 10px;
	height: 20px;
	opacity: 20px;	
	width: 400px;
}

input[type=submit] {
	margin: 10px;
	height: 30px;
	color: white; background-color : green; border-radius : 50px;
	width: 150px;
	opacity: 20px;
	background-color: green;
}

.button1 {
	height: 300px;
	border-radius : 30px;
	width: 500px;
	background-color: aqua;
	float: left;
	margin-top:100px;
	margin-left:200px;
}

.button2 {
	height: 300px;
	border-radius : 30px;
	width: 500px;
	background-color: silver;
	margin-left: 10px;
	float: left;
	margin-top:100px;
}

.center {
	margin: 130px;
	margin-left:190px;
}

.button1:hover {
	border-color: white;
	border-style: solid;
}

.button2:hover {
	border-color: white;
	border-style: solid;
}
</style>
</head>
<body bgcolor="black">
	<div style="color:white;margin-left:500px;margin-top:50px;">
		<h1>Please Login or Sign up first</h1>
	</div>
	<a href="login_from.jsp">
		<div class="button1">
			<h2 class="center">Login</h2>
		</div>
	</a>

	<a href="register_form.jsp">
		<div class="button2">
			<h2 class="center">Sign UP</h2>
		</div>
	</a>
	
	<div id="ajaxx"></div>
	
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
</body>
</html>
<script>
	$(document).ready(function(){
		console.log("in function====");
		$.ajax({
			type:"POST",
			data:{name:"prit"},
			url:"${pageContext.request.contextPath}/AjaxController",
			success:function(result){
				$("#ajaxx").html(result);
				console.log("output is=="+result);		
			}			
		});
		console.log("error");
	})	
</script>

