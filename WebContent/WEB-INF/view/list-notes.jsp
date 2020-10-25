<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Notepad</title>

<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/list-notes.css"
/>


</head>
<body>

	<script>
    	if ( window.history.replaceState ) {
        	window.history.replaceState( null, null, window.location.href );
    	}
	</script>

	<div id="topHeader">
		Welcome ${user.firstName }
		<br><br>
		<a href="${pageContext.request.contextPath}/user/login">Log Out</a>
	</div>
	
	
	<div id="mainHeader">
		<h2>My Notes</h2>
		
		<c:url var="createNoteLink" value="/notes/showCreateNoteForm">
		</c:url>
		
		<a href="${createNoteLink}">
			<img src="${pageContext.request.contextPath }/resources/images/add.png" height="40px" width="40px" title="Create New"/>
		</a>
	</div>
	
	<br><br><br>
	
	<div id="body">
		
			<div class="row">
			
				<c:forEach var="theNotes" items="${notes }">
				
						<c:url var="updateLink" value="/notes/showFormForUpdate">
							<c:param name="noteId" value="${theNotes.id }" />
						</c:url>
					
						<c:url var="deleteLink" value="/notes/delete">
							<c:param name="noteId" value="${theNotes.id }" />
						</c:url>
				
						<div class="column">
						
							<div align="right">
							
								<a href="${updateLink}">
									<img src="${pageContext.request.contextPath }/resources/images/edit.png" height="20px" width="20px" title="Edit"/>
								</a>
								
								<a href="${deleteLink}" onclick="if(!(confirm('Are you sure you want to delete this note?'))) return false">
									<img src="${pageContext.request.contextPath }/resources/images/delete.png" height="20px" width="20px" title="Delete"/>
								</a>
								
							</div>
							
							<div>
								<h3>
								<i>${theNotes.title }</i>
								</h3>
								
								<p>
								${theNotes.content }
								</p>
							</div>
							
							<div id="bottom-right">
								<i>
									${theNotes.getTimeDateInfo() }
								</i>	
							</div>
								
						</div>
							
				</c:forEach>
				
			</div>
			
	</div>
	
	<!-- don't refresh the page as it gives error because the data have to be submitted again -->
	
	
	
</body>
</html>