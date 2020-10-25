<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/form.css"
/>

</head>
<body>
	
	<div class="form_div">
		
		<h2>Online Notepad - Log In</h2>
		
		<form:form action="validateUser" modelAttribute="user" method="POST">
		
			<form:hidden path="id"/>
				
			<table>
				<tbody>
					<tr>
						<td><label>Email:</label></td>
						<td><form:input class="input" type="email" path="email" /></td>
					</tr>
					
					<tr>
						<td><label>Password:</label></td>
						<td><form:password path="password" class="input"/></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Log In" class="login" /></td>
					</tr>
				</tbody>
			</table>
			
		</form:form>
		
		<p style="font-size:0.7em;"><i>
		New member? Sign up 
		<a href="${pageContext.request.contextPath }/user/signup" >here</a>
		</i></p>
		
	</div>
	
	
</body>
</html>