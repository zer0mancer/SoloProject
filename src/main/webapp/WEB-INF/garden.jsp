<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Hanging Garden</title>
</head>
<body>

	<div>
		<div>
			<h1>Welcome back, <c:out value="${loggedIn.username}"></c:out>!</h1>
		</div>
		
		<div>
			<a href="plant/add">+<u>Add your new Plant!+</u></a>
		</div>
		
		<div>
			<h3>All of the Plants growing in our Community</h3>
		</div>
		
		<div>
			<table>
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
		
		<div>
			<a href="/logout"><b>Sign Out</b></a>
		</div>
			
			
						
					
				
		
	

	</div>

</body>
</html>