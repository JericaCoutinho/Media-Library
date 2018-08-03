<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
img {
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
}
img:hover {
    opacity: 1.0;
    filter: alpha(opacity=100); /* For IE8 and earlier */
}
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
<title>View Posts</title>
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
      <a class="navbar-brand" href="/"><img src="logo1.png" height="42" width="42" >   Media Library</a>
    </div>
    <ul class="nav navbar-nav">
    	<li class="active"><a href="/createprofile"><b><font color="white">Edit Profile</font></b></a></li>
    </ul>
     <ul class="nav navbar-nav">
    	<li class="active"><a href="/posts"><b><font color="white">View Posts</font></b></a></li>
    </ul>
    <ul class="nav navbar-nav">
    	<li class="active"><a href="/recordAudio"><b><font color="white">Add Post</font></b></a></li>
    </ul>
    
    <ul class="nav navbar-nav">
       <li class="active"><a href="/facebookRedirect"><b><font color="white">Home</font></b></a></li>
    </ul>
    
  </div>
</nav>
<h1><font color="red"><b><center>POST THUMBNAILS</center></b></font></h1><br>
 
<c:forEach items="${post}" var="posts">
 			 		<a href="/yourpost?id=${posts.postid}">
 			 			<img src="${posts.postimg}" height="300" width="300" />
 			 		</a> 
			</c:forEach>	 	
</body>
</html>