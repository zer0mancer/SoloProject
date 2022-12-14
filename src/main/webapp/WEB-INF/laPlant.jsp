<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html class="details">
<head>
<meta charset="ISO-8859-1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
      <link rel="stylesheet" href="/css/style.css"/>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<title>Hope you're Alone</title>
</head>
<body>

	<header class="hero center is-primary">
		<div class="">
			<h1 class="title has-text-centered">Plant Parenthood</h1>
		<p class="subtitle has-text-centered">We all Grow Together</p>
		</div>
	</header>

	<div class=" column field-is-grouped has-background-success-dark" id="info-card">
		<div class="has-text-centered">
			<h1 class="control is-underlined is-size-3"><c:out value="${plant.name}"></c:out></h1>
			<h3 class="control is-size-4 has-text-black-ter"><i>Belongs to: <c:out value="${plant.user.username}"></c:out></i></h3>
		</div>
		
		<div class="has-text-centered has-text-black has-text-weight-semibold is-size-5">
			<p> Plant Type: <c:out value="${plant.name}"></c:out></p>
			<p>Height: <c:out value="${plant.height}"></c:out></p>
			<p>Soil Preference: <c:out value="${plant.soil}"></c:out></p>
			<p>How much Sunlight does <c:out value="${plant.name}"></c:out> like?: <c:out value="${plant.sunlight}"></c:out></p>
		</div>			
			
			<div class="has-text-centered">
				<div class="m-4">
					<c:if test="${plant.user.id ==loggedIn.id}">
						<p><a class="button is-warning mt-2 is-rounded" href="/plant/repotting/${plant.id}">
							<span>
								<i class="fa fa-magic mr-2"></i>
							</span>
							Edit
							<span>
								<i class="fa fa-magic ml-2"></i>
							</span>
						</a>
						
						</p>
						
						<form action="/overwater/${plant.id}" method="post">
							<button class="button is-danger mt-4">
								<span>
									 <i class="fa fa-ban mr-2"></i>
								 </span>
								Delete Plant
								 <span>
									 <i class="fa fa-ban ml-2"></i>
								 </span>
  							</button>
						</form>
						
					</c:if>
				</div>
				<p><a class="button is-primary is-rounded" id="pink-text" href="/homepage">
					<span class="material-symbols-outlined mr-2">
							local_florist
					</span>
					All Plants
					<span>
						<i class="fa fa-leaf ml-2"></i>
					</span>
				</a></p>
			</div>
			
	</div>
	
	

</body>
</html>