 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login &amp; Register</title>
<!-- We have learned that while using the ampersand "&" that we MUST enclose it as such: "&amp;" -->
</head>
<body>

<h1>This is your LOGIN PAGE!!!</h1>

	<div>
		<h1>Welcome Plant Parents!</h1>
		<p>Log yourself in or Register to join our community!</p>
	</div>

	<div>
		<div>
			<h3>Are you a new parent?</h3>
			<h3>Register Here!</h3>
			<form:form action="/register" modelAttribute="newUser" method="post">
			
				<p>
					<form:label path="username">Username:</form:label>
					<form:errors path="username"></form:errors>
					<form:input path="username" type="text"/>
				</p>
				<p>
					<form:label path="email">Email:</form:label>
					<form:errors path="email"></form:errors>
					<form:input path="email" type="text"/>
				</p>
				<p>
					<form:label path="password">Password:</form:label>
					<form:errors path="password"></form:errors>
					<form:input path="password" type="password"/>
				</p>
				 <p>
					<form:label path="confirmPassword">Confirm:</form:label>
					<form:errors path="confirmPassword"></form:errors>
					<form:input path="confirmPassword" type="password"/>
				</p>
			
			
			</form:form>
		</div>
	</div>


</body>
</html>