<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add your plant here!</title>
</head>
<body>
	<div>
		<div>
			<h1>Add your Plant!</h1>
		</div>
		
		<div>
			<form:form action="/plant/addPlant" method="post" modelAttribute="newPlant">
				<p>
					<form:label path="name">Plant Name:</form:label>
				</p>
				<p>
					<form:errors path="name"></form:errors>
					<form:input path="name" type="text"/>
				</p>
					<p>
					<form:label path="color">Color of Plant:</form:label>
				</p>
				<p>
					<form:errors path="color"></form:errors>
					<form:input path="color" type="text"/>
				</p>
					<p>
					<form:label path="height">Height of Plant:</form:label>
				</p>
				<p>
					<form:errors path="height"></form:errors>
					<form:input path="height" type="text"/>
				</p>
					<p>
					<form:label path="soil">Soil preference:</form:label>
				</p>
				<p>
					<form:errors path="soil"></form:errors>
					<form:input path="soil" type="text"/>
				</p>
					<p>
					<form:label path="sunlight">Sunlight:</form:label>
				</p>
				<p>
					<form:errors path="sunlight"></form:errors>
					<form:input path="sunlight" type="text"/>
				</p>
				
				
				<p>
					<form:errors path="user"></form:errors>
					<form:input path="user"  type="hidden" value="${loggedIn.id}"/>
				</p>
			
				<p><button>Add your Plant</button></p>
			</form:form>
		</div>
	
	
	
	
	</div>

</body>
</html>