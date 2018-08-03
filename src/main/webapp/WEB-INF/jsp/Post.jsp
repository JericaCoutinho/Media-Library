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
.button {
    background-color: #555555;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
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
<h1><font color="red"><b><center>**YOUR POST**</center></b></font></h1><br>
<br>
<!--  <img style="float:left" src="${postImg}"  height="300" width="300" alt="Profile Page Image"> -->
<center><img src="${post.postimg}" height="300" width="300" alt="Profile Page Image"/></center>
<center><audio autoplay>
<source src="${post.postaudio}" type="audio/webm">
</audio>
</center>
<br>
<center> <p> ${post.postDescription} </p> </center>

 <br>
 
 <br>
   <form action="/comment" method="get">
 <input type="hidden" name="id" value="${post.postid}"/>
 <center><input type="text" name="comment"/></center>
 <center> <button class="button" onclick="window.location.href='/comment' ">ADD COMMENT</button></center>
 <%-- <c:forEach items="${comment}" var="com">
 			 		<p>${com.comments}</p>
			</c:forEach> 
			<br> --%>
			
			
 <br>

</form>
</body>
</html> 