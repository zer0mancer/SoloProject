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
<body class="main">

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
				<span class="material-symbols-outlined pr-2 has-text-warning icon is-large">clear_day</span>
					Welcome back,
				<c:out value="${loggedIn.username}"></c:out>
				!<span class="material-symbols-outlined has-text-link icon is-large">brightness_3</span>				
			</h1>
		</div>

		<div>
			<a class="button is-success is-underlined mt-3" href="plant/add">
				<span class="material-symbols-outlined pr-2">psychiatry</span>
					Add your new Plant!
				<span class="material-symbols-outlined pl-2">psychiatry</span>	
			</a>
		</div>

		<div class="mt-6 is-underlined is-size-5 is-family-monospace table-head">
			<h3>
					<span class="material-symbols-outlined">yard</span>
				All of the Plants growing in our Community
					<span class="material-symbols-outlined">yard</span>
			</h3>
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
							<td class="is-italic">
								<span class="material-symbols-outlined">face</span>
									${plant.user.username}
								<span class="material-symbols-outlined">face_4</span>
									</td>
							
							<td class="has-text-weight-semibold">
								<span class="material-symbols-outlined">potted_plant</span>
									${plant.name}
								<span class="material-symbols-outlined">emoji_nature</span>
							</td>
							
							<td><a class="is-underlined" href="plant/info/${plant.id}">
								<span class="material-symbols-outlined">auto_stories</span>
							 		Details
								<span class="material-symbols-outlined">draw</span>
							 	</a>
							 </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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