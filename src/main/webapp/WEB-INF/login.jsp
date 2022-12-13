 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">

<title>Login &amp; Register</title>
<!-- We have learned that while using the ampersand "&" that we MUST enclose it as such: "&amp;" -->
</head>
<body>

	<header class="hero center is-primary">
		<div class="hero body">
			<h1 class="title">Plant Parenthood</h1>
		</div>
		<p class="subtitle">We all Grow Together</p>
	
	</header>

	<div>
		<h1>Welcome Plant Parents!</h1>
		<p>Log yourself in or Register to join our community!</p>
	</div>

	<div>
		<div class="box">
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
			
				<button class="button is-primary">Join us now!</button>
			</form:form>
		</div>
		
		<div class="box">
			<h3>Already a part of our Growing Community?</h3>
			<h3>Welcome back, Log in here!</h3>
				<form:form action="/login" modelAttribute="newLogin" method="post">
				
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
					
					<button class="button is-success">Let's get Growing!</button>
					
					
				</form:form>
		</div>
	</div>


</body>
</html>