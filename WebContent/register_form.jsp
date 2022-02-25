<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	border-color:black;
	border-style:solid;
	border-radius : 10px;
}
input[type=email] {
	border-color:black;
	border-style:solid;
	margin: 10px;
	height: 40px;
	opacity: 20px;
	border-radius : 10px;
	width: 400px;
}
input[type=password] {
	border-color:black;
	border-style:solid;
	border-radius : 10px;
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
<head>
<meta charset="UTF-8">
<title>SignUP</title>
</head>
<body bgcolor="gray">
	<p>
	<center>
		<h2>SignUp</h2>
		<h3 style="font-color: white">Please Enter Your Details</h3>
		<form action="login.jsp" method="post">
			<input type="text" value="" name="username" required="required" placeholder="Enter username">
			<br /> <input type="email" value="" name="email" required="required" placeholder="Enter Email">
			<br /> <input type="password" value="" name="password" required="required" placeholder="Enter Password"> <br/>
			<input type="submit" value="submit">
		</form>
	</center>
	</p>
</body>
</html>