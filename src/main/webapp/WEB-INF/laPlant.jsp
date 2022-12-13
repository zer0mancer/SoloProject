<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hope you're Alone</title>
</head>
<body>

	<div>
		<div>
			<h1><c:out value="${plant.name}"></c:out></h1>
			<h3>Belongs to: <c:out value="${plant.user.username}"></c:out></h3>
		</div>
		
		<div>
			<p> Plant Type: <c:out value="${plant.name}"></c:out></p>
			<p>Height: <c:out value="${plant.height}"></c:out></p>
			<p>Soil Preference: <c:out value="${plant.soil}"></c:out></p>
			<p>How much Sunlight does <c:out value="${plant.name}"></c:out> like?: <c:out value="${plant.sunlight}"></c:out></p>
		</div>			
			
			<div>
				<div>
					<c:if test="${plant.user.id ==loggedIn.id}">
						<p><a href="/plant/repotting/${plant.id}">Edit ((insert icon here))</a></p>
						<form action="/overwater/${plant.id}" method="post">
							<button>Delete Plant ((sad face icon here INSERT))</button>
						</form>
					</c:if>
				</div>
				<p><a href="/homepage">All Plants{{icon}}</a></p>
			</div>
			
	</div>
	
	
	
</body>
</html>