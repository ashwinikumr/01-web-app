<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<html>
<head>
	<title>luv2code company home page</title>
</head>
<body>
	<h2>luv2code company home page</h2>
	<hr>
	
	<p>
	welcome to luv2code company home page
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
		<p>
			User: <security:authentication property="principal.username"/>
			<br><br>
			Role(s): <security:authentication property="principal.authorities"/>
		</p>
		
	
	
	<security:authorize access="hasRole('MANAGER')">
			
			<!-- add a link to point to /leader ... this is for the manager -->
			
			<p>
				<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
				(only for Manager Peeps)
			</p>
	
	</security:authorize>
	
	
	<security:authorize access="hasRole('ADMIN')">
			
			<!-- add a link to point to /systems ... this is for the Admin -->
			
			<p>
				<a href="${pageContext.request.contextPath}/systems">IT System Meeting</a>
				(only for Admin Peeps)
			</p>
			
	</security:authorize>
	
	<hr>
	
	<!-- add a logout button -->
		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			
			<input type="submit" value="Logout"/>
		</form:form>
</body>
</html>