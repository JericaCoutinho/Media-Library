<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
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
<body>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><img src="logo1.png" height="42" width="42" >   Media Library</a>
    </div>
    <ul class="nav navbar-nav">
       <li class="active"><a href="index.jsp">Home</a></li>
    </ul>
  </div>
</nav>

<div class="paragraphs">
<div class="row">
<div class="span4">
 
    
        	<img style="float:left" src="${imgSrc}"  height="300" width="300" alt="Profile Page Image">
            
       
      
  <div class="container">
<div class="row">  
    <div class="media-body">
      <h4 class="media-heading"><b>JERICA COUTINHO</b></h4>
      <br><p style="clear:both">  Hi, I am a Computer Science Graduate Student at SUNY Albany. This is my Software Engineering homework assignment 2.</p>
    </div>
  </div>
 </div>
      
      </div>
      </div>
</div>



  




</body>
</html>