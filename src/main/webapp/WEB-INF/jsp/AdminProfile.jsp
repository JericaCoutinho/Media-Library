<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
sidenav {
		width: 160px;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
		background-color: #E0E0E0;
		overflow-x: hidden;
		padding-top: 20px; 	
}
ul {
	
    list-style-type: none;
    margin: 0;
    padding: 0;	
}

li {
    display: inline;
}	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</head>
<body bgcolor="#E0E0E0">

<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="logo.png" height="42" width="42" >   Media Library</a>
    </div>
     <ul class="nav navbar-nav">
    	<li class="active"><a href="/posts"><b><font color="white">View Posts</font></b></a></li>
    </ul>
    <ul class="nav navbar-nav">
    	<li class="active"><a href="/recordAudio"><b><font color="white">Add Post</font></b></a></li>
    </ul>
    
    <ul class="nav navbar-nav">
       <li class="active"><a href="/"><b><font color="white">Home</font></b></a></li>
    </ul>
    
  </div>
</nav>
<div class="paragraphs">
<div class="row">
<div class="span4">
 
    
   
  <div class="container">
<div class="row">  
    <div class="media-body">
   <h4> <b>    JERICA COUTINHO    </b> </h4>
      <br>
      <p style="clear:both"> HELLO! I AM THE ADMIN OF MEDIA LIBRARY</p> 
    </div>
  </div>
 </div>
      
      </div>
      </div>
</div>
<div>
<h1>List of users</h1>

<c:forEach items="${user}" var="users">
 			 		  <a href="/getpost?email=${users.email}">  
 			 			<p> ${users.name} </p>
 			 			
 			 		</a>
			</c:forEach>
				
</div>
</body>
</html>