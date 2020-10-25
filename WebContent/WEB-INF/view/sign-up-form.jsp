<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<style>
	.error{
	color:red;
	font-size: 0.8em !important;
	margin:10px;
	}
</style>

<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/form.css"
/>

<script>
	function checkPass(){
		if(document.getElementById("password").value != document.getElementById("confirm_password").value){
			alert("Passwords didn't match!")
			return false;
		}
	}

</script>

</head>
<body>
		
	<div class="form_div">
		
		
		<h2>Online Notepad - Sign Up</h2>
		
		
		<form:form action="createUser" modelAttribute="user" method="POST">
		
			<form:hidden path="id"/>
			
			<table>
				<tbody>
					<tr>
						<td><label>First Name:</label></td>
						<td><form:input path="firstName" class="input"/></td>
						<td><form:errors path="firstName" cssClass="error" /></td>
					</tr>
				
					<tr>
						<td><label>Last Name:</label></td>
						<td><form:input path="lastName" class="input"/></td>
						<td><form:errors path="lastName" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Birth Date:</label></td>
						<td> <form:input type="date" path="birthDate" class="input"/> </td>
					</tr>
					
					<tr>
						<td><label>Email:</label></td>
						<td><form:input type="email" path="email" class="input"/></td>
						<td><form:errors path="email" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Password:</label></td>
						<td><form:password path="password" id="password" class="input"/></td>
						<td><form:errors path="password" cssClass="error" /></td>
						
					</tr>
					
					<tr>
						<td><label>Confirm Password:</label></td>
						<td><form:password path="" id="confirm_password" class="input"/></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Sign Up" onclick="return checkPass()"/></td>
					</tr>
				</tbody>
			</table>
			
			
		</form:form>
		
		<p style="font-size:0.7em;"><i>
		Already a member? Log in 
		<a href="${pageContext.request.contextPath }/user/login" >here</a>
		</i></p>
		
	</div>
	
</body>
</html>