<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>The Hanging Garden</title>
</head>
<body>

	<header class="hero center is-primary">
		<div>
			<div>
				<h1 class="title has-text-centered">Plant Parenthood</h1>
			</div>			
				<p class="subtitle has-text-centered"><i>We all Grow Together</i></p>
		</div>
	</header>

	<div class="has-text-centered mt-4">
		<div>
			<h1>
				Welcome back,
				<c:out value="${loggedIn.username}"></c:out>
				!
			</h1>
		</div>

		<div>
			<a class="button is-success is-underlined mt-3 has-border-dark" href="plant/add">+Add your new Plant!+</a>
		</div>

		<div class="mt-6 is-underlined is-size-5 is-family-monospace table-head">
			<h3>All of the Plants growing in our Community</h3>
		</div>

		<div class="table-head">
			<table class="table">
				<thead>
					<tr>
						<th>User:</th>
						<th>Plant type:</th>
						<th>Navigate:</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${plants}" var="plant">
						<tr>
							<td>${plant.user.username}</td>
							<td>${plant.name}</td>
							<td><a href="plant/info/${plant.id}">Additional Details</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
				<p class="has-text-centered mt-6">
					<a class="button is-outlined" href="/logout"><b>Sign Out</b></a>
				</p>









	</div>

</body>
</html>