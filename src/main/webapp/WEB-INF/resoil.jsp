<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<title>Let's Re-pot your Plant</title>
</head>
<body id="resoil">

	<header class="hero center is-primary">
		<div class="">
			<h1 class="title has-text-centered">Plant Parenthood</h1>
			<p class="subtitle has-text-centered">We all Grow Together</p>
		</div>
	</header>

	<div class="hero body is-align-items center">
		<div class="is-align-items-center">
			<h1
				 class="has-text-centered has-background-primary title is-4 mt-6 p-4">
				 	<span class="material-symbols-outlined pr-2">rainy</span>
				Let's Re-pot your Plant!
					<span class="material-symbols-outlined pl-2">rainy</span>
			</h1>
		</div>



		<div class="box mt-6" id="upgrade-fields">
			<div class="m-6">
				<form:form action="/plant/repotted/${resoil.id}" method="put"
					modelAttribute="resoil">
					<div class="field">
						<p class="has-text-centered">
							<form:label class="label has-background-link has-text-white" path="name">Plant Name:</form:label>
						</p>
						<p>
							<form:errors class="has-text-danger" path="name"></form:errors>
							<form:input class="input is-link" path="name" type="text" />
						</p>
					</div>
					<div class="field">
						<p class="has-text-centered">
							<form:label class="label has-background-success" path="color">Color of Plant:</form:label>
						</p>
						<p>
							<form:errors class="has-test-danger" path="color"></form:errors>
							<form:input class="input is-primary" path="color" type="text" />
						</p>
					</div>
					<div class="field">
						<p class="has-text-centered">
							<form:label class="label has-background-danger has-text-white" path="height">Height of Plant:</form:label>
						</p>
						<p>
							<form:errors class="has-text-danger" path="height"></form:errors>
							<form:input class="input is-primary" path="height" type="text" />
						</p>
					</div>
					<div class="field">
						<p class="has-text-centered">
							<form:label class="label has-background-dark has-text-white" path="soil">Soil preference:</form:label>
						</p>
						<p>
							<form:errors class="has-text-danger" path="soil"></form:errors>
							<form:input class="input is-primary" path="soil" type="text" />
						</p>
					</div>
					<div class="field mb-5">
						<p class="has-text-centered">
							<form:label class="label has-background-warning has-text-white" path="sunlight">Sunlight:</form:label>
						</p>
						<p>
							<form:errors class="has-text-danger" path="sunlight"></form:errors>
							<form:input class="input is-warning" path="sunlight" type="text" />
						</p>
					</div>


					<p>
						<form:errors path="user"></form:errors>
						<form:input path="user" type="hidden" value="${loggedIn.id}" />
					</p>

					<p class="has-text-centered mt-4">
						<button class="button text-is-size-5 is-rounded has-text-success-dark has-background-danger-light">
							<span class="material-symbols-outlined pr-2">water_drop</span>
								Update your Plant
							<span class="material-symbols-outlined pl-2">potted_plant</span>
						</button>
					</p>
				</form:form>
					<p class="has-text-centered mt-4">
						<a class="button is-warning is-rounded" id="pink-text" href="/homepage">
							<span class="material-symbols-outlined mr-2">local_florist</span>
								Cancel
							<span class="material-symbols-outlined ml-2">local_florist</span>
						</a>
					</p>		
								
			</div>


		</div>
				<p class="has-text-centered mt-6">
					<a class="button is-outlined" href="/logout"><b>
						<span class="material-symbols-outlined pr-2">hiking</span>
							Sign Out
						<span class="material-symbols-outlined pl-2">door_open</span>
						</b></a>
				</p>
	</div>
</body>
</html>