<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
      <link rel="stylesheet" href="/css/style.css"/>
      <link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   

<title>Add your plant here!</title>
</head>
<body id="addPlant">

	<header class="hero center is-primary">
		<div class="">
			<h1 class="title has-text-centered">Plant Parenthood</h1>
		<p class="subtitle has-text-centered">We all Grow Together</p>
		</div>
	</header>
	
	<div class="hero body is-align-items center">
		<div class="is-align-items-center">
			<h1 class="has-text-centered has-background-primary title is-4 mt-6 p-4">Add your Plant!</h1>
		</div>
		
		<div class="m-6">
			<form:form class="box m-6 pink" action="/plant/addPlant" method="post" modelAttribute="newPlant">
				<div class="field">
					<p>
						<form:label class="label" path="name">Plant Name:</form:label>
					</p>
					<p>
						<form:errors path="name"></form:errors>
						<form:input class="input is-link" path="name" type="text"/>
					</p>
				</div>
				<div class="field">
					<p>
						<form:label class="label" path="color">Color of Plant:</form:label>
					</p>
					<p>
						<form:errors path="color"></form:errors>
						<form:input class="input is-primary" path="color" type="text"/>
					</p>
				</div>
				<div class="field">
					<p>
						<form:label class="label" path="height">Height of Plant:</form:label>
					</p>
					<p>
						<form:errors path="height"></form:errors>
						<form:input class="input is-primary" path="height" type="text"/>
					</p>
				</div>
				<div class="field">
					<p>
						<form:label class="label" path="soil">Soil preference:</form:label>
					</p>
					<p>
						<form:errors path="soil"></form:errors>
						<form:input class="input is-primary" path="soil" type="text"/>
					</p>
				</div>
				<div class="field">
					<p>
						<form:label  class="label" path="sunlight">Sunlight:</form:label>
					</p>
					<p>
						<form:errors path="sunlight"></form:errors>
						<form:input class="input is-warning" path="sunlight" type="text"/>
					</p>
				</div>
				
				
				<p>
					<form:errors path="user"></form:errors>
					<form:input path="user"  type="hidden" value="${loggedIn.id}"/>
				</p>
			
				<p class="has-text-centered"><button class="button is-primary p-5 " id="pink-text">Add your Plant</button></p>
			</form:form>
		</div>
	
			<p class="has-text-centered mt-6">
				<a class="button is-outlined" href="/logout">
					<b>
					<span class="material-symbols-outlined pr-2">hiking</span>
						Sign Out
					<span class="material-symbols-outlined pl-2">door_open</span>
					</b>
				</a>
			</p>
	
	
	</div>

</body>
</html>