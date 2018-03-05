<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Upload</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
  

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="navbar-brand" href="index.jsp"><img src="logo1.png" height="42" width="42" >   Media Library</a>
  </li>
  </ul>
  </nav>
      
   
<br>
<br>
<form action="/upload" method="post" enctype="multipart/form-data">
<i><b>Upload Post:</b></i><br><input type="file" name="file" id="uploadImage"/>
<br>
<br>
<input type="Submit" id="upload"/>

</form>
</body>
</html>