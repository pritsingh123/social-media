<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<style type="text/css">
	input[type=text] {
	margin: 10px;
	margin-top: 50px;
	border-color:black;
	border-style:solid;
	margin: 10px;
	height: 40px;
	opacity: 20px;
	width: 400px;
	
}

input[type=password] {
	border-color:black;
	border-style:solid;
	margin: 10px;
	height: 40px;
	opacity: 20px;
	width: 400px;
}
input[type=submit] {
	margin: 10px;
	height: 30px;
	color: white; background-color : green;
	border-radius : 10px;
	width: 150px;
	opacity: 20px;
	background-color: green;
}
</style>
</head>
<body bgcolor="grey">
	<p>
	<center>
		<h2>SignUp</h2>
		<h3 style="font-color: white">Enter Your Details</h3>
		<form action="login.jsp" method="post">			
			<input type="text" value="" name="username" required="required" placeholder="Username"></br>			
			<br /> <input type="password" value="" name="password" required="required" placeholder="Password"> 
			<br /> <input type="submit"	value="submit">
		</form>
	</center>
	</p>
</body>
</html>