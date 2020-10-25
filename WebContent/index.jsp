<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Notepad - Welcome</title>

<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/index.css"
/>


</head>
<body>
	<div id = "Links">
		<h2>Welcome to Online Notepad</h2>
		<br>
		<div id="signUp">
			<a href="user/signup" >Sign Up</a>
		</div>
		<div id="signIn">	
			<a href="user/login" >Log In</a>
		</div>
	</div>
</body>
</html>