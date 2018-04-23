<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>All Users</title>

</head>

<body>

<div class"container">
	<div class="row">
		<table class="table">
  			<thead class="thead-dark">
   				 <tr>
      				<th scope="col">ID</th>
      				<th scope="col">Email</th>
      				<th scope="col">Name</th>
    			</tr>
 			 </thead>
 			 <tbody>
 			 <c:forEach items="${users}" var="user">
 			 		<tr>
 			 			<td><c:out value="${user.id}"/></td>
 			 			<td><c:out value="${user.name}"/></td>
 			 			<td><c:out value="${user.email}"/></td>
					</tr>
			</c:forEach>	 			 			
 			 </tbody>
  		</table>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
</body>
</html>