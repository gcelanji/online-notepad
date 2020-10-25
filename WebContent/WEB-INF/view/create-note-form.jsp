<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New</title>
<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/form.css"
/>

</head>
<body>
		
		<c:url var="createNoteLink" value="/notes/createNote">
		</c:url>

		<c:url var="listNotesLink" value="/notes/return">
		</c:url>
	
	
	<div class="form_div" >
		
		
		<h2>Create New</h2>
		
		<form:form action="createNote?userId=${user.id}" modelAttribute="note" method="POST">
		
			<form:hidden path="id"/>
			
			<table>
				<tbody>
					<tr>
						<td><label>Title:</label></td>
						<td><form:input path="title" class="input"/></td>
					</tr>
				
					<tr>
						<td><label>Text:</label></td>
						<td><form:textarea path="content" rows="10" cols="40" class="input"></form:textarea></td>
					</tr>
					
				
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Done" /></td>
						
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><a href=${listNotesLink } style="font-size:0.7em;">Cancel</a></td>
					</tr>
				</tbody>
			</table>
			
		</form:form>
	</div>
</body>
</html>