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
   <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
   <link rel="stylesheet" href="/css/style.css"/>
   
   

<title>Login &amp; Register</title>
<!-- We have learned that while using the ampersand "&" that we MUST enclose it as such: "&amp;" -->
</head>
<body class="login">

	<header class="hero center is-primary">
		<div class="">
			<h1 class="title">Plant Parenthood</h1>
		<p class="subtitle is-align-items-center ml-5">We all Grow Together</p>
		</div>
	</header>
	
	<div class="hero body is-align-items-center">
		<h1 class="is-align-items-center">Welcome Plant Parents!</h1>
		<p class="is-align-items-center grow">Log yourself in or Register to join our community!</p>
	</div>


	<div class="container">
		<div class="columns mt-6" id="center">
	
			<div class="box is-4 column ">
				<div class="is-size-5 has-text-centered">
					<h3>Are you a new parent?</h3>
					<h3>Register Here!</h3>
				</div>
			
			<form:form action="/register" modelAttribute="newUser" method="post">
			
				<p class="has-text-centered field">
					<form:label class="label"  path="username">Username:</form:label>
					<form:errors path="username"></form:errors>
					<form:input class="input"  path="username" type="text"/>
				</p>
				<p class="has-text-centered field">
					<form:label class="label" path="email">Email:</form:label>
					<form:errors path="email"></form:errors>
					<form:input class="input" path="email" type="text"/>
				</p>
				<p class="has-text-centered field">
					<form:label class="label" path="password">Password:</form:label>
					<form:errors path="password"></form:errors>
					<form:input class="input" path="password" type="password"/>
				</p>
				 <p class="has-text-centered field">
					<form:label class="label" path="confirmPassword">Confirm:</form:label>
					<form:errors path="confirmPassword"></form:errors>
					<form:input class="input" path="confirmPassword" type="password"/>
				</p>
				
				<p class="has-text-centered">
				<button class="button is-warning">Join us now!</button>
				</p>
			</form:form>
		</div>
		
		<div class="box is-4 column  ">
			<div class="is-size-5 has-text-centered">
				<h3>Already a part of our Growing Community?</h3>
				<h3>Welcome back, Log in here!</h3>
		
			</div>
				<form:form action="/login" modelAttribute="newLogin" method="post">
				
					<p class="has-text-centered field">
						<form:label class="label" path="email">Email:</form:label>
						<form:errors path="email"></form:errors>
						<form:input class="input" path="email" type="text"/>
					</p>
					
					<p class="has-text-centered field">
						<form:label class="label" path="password">Password:</form:label>
						<form:errors path="password"></form:errors>
						<form:input class="input" path="password" type="password"/>
					</p>
					
					<p class="has-text-centered">
					<button class="button is-success">Let's get Growing!</button>
					</p>
				</form:form>
				</div>
			</div>
	</div>
</body>
					
					
</html>