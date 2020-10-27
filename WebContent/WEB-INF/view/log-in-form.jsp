<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<link 
	type = "text/css"
	rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/modal.css"
/>

</head>
<body>
	
	<div class="form_div">
		
		<h2>Online Notepad - Log In</h2>
		
		<form:form name="Login_Form" action="validateUser" modelAttribute="user" method="POST" onsubmit="return validateForm()">
		
			<form:hidden path="id"/>
				
			<table>
				<tbody>
					<tr>
						<td><label>Email:</label></td>
						<td><form:input id="email" class="input" type="email" path="email" /></td>
					</tr>
					
					<tr>
						<td><label>Password:</label></td>
						<td><form:password id="password" path="password" class="input"/></td>
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
	
	
	
	<!-- The Modal -->
		<div id="MyModal" class="modal">

  			<!-- Modal content -->
  			<div class="modal-content">
    			<span class="close">&times;</span>
    			<p id="printMessage" style="text-align:center;"></p>
  			</div>

		</div>
	
	
	<!-- Check if login failed and print message -->
	
	<c:if test="${login_failed}" >
		
		<script>
		
			//Insert message to print on screen
			document.getElementById("printMessage").innerHTML = "Wrong Credentianls. Please Try again.";
		
			// Get the modal
			var modal = document.getElementById("MyModal");
				
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
				
			modal.style.display = "block";
				
				
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none"; 
			  }
			}

		</script>
		
	</c:if>
	
	
	<!-- Check if a new user was created and print the message -->
	
	<c:if test="${user_created}" >
		
		<script>
		
			//Insert message to print on screen
			document.getElementById("printMessage").innerHTML = "User Created Successfully. You can now log in! ";
		
			// Get the modal
			var modal = document.getElementById("MyModal");
				
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
				
			modal.style.display = "block";
				
				
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			  if (event.target == modal) {
			    modal.style.display = "none"; 
			  }
			}

		</script>
		
	</c:if>
	
	
	<!-- validate form for empty fields -->
	
	<script type="text/javascript">
	 	function validateForm(){
	 		
	 		var email_value = document.getElementById("email").value ; 
	 		var password_value = document.getElementById("password").value; 
	 		
	 		if (email_value == null  || email_value == "",  password_value == null  || password_value == ""){
	 			//Insert message to print on screen
				document.getElementById("printMessage").innerHTML = "Please fill in all required fields. ";
			
				// Get the modal
				var modal = document.getElementById("MyModal");
					
				// Get the <span> element that closes the modal
				var span = document.getElementsByClassName("close")[0];
					
				modal.style.display = "block";
					
					
				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
					modal.style.display = "none";
				}

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				  if (event.target == modal) {
				    modal.style.display = "none"; 
				  }
				}
				return false;
	 		}
	 	}
	</script>
	
</body>
</html>