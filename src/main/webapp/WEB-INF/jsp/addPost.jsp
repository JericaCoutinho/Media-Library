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
<body bgcolor="#E0E0E0">
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="logo1.png" height="42" width="42" >   Media Library</a>
    </div>
    <ul class="nav navbar-nav">
    	<li class="active"><a href="#"><b><font color="white">Add Post</font></b></a></li>
    </ul>
    
    <ul class="nav navbar-nav">
       <li class="active"><a href="//facebookRedirect"><b><font color="white">Home</font></b></a></li>
    </ul>
    
  </div>
</nav>

<br>
<br>
<h1><font color="red"><b><center>ADD POST</center></b></font></h1><br>
 <center><form action="/addPost" method="post" enctype="multipart/form-data">
<b><center><font size="6">Upload post:</font></b><br><input type="file" name="file"/></center>
<br>
<br>
<b><center><font size="6">Enter Post Description: </font></center></b><br><input type="text" name="pdesc" />
<br>
<br>
<center><input type="Submit" id="upload"/> </center>

</form>  
 </center>
</body>
</html>

</body>
</html>