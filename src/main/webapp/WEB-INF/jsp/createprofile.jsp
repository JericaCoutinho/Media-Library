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
<style>
div {
    background-color: lightgrey;
    width: 300px;
    border: 25px solid black;
    padding: 25px;
    margin: 25px;
    align: center;
}
/* body {
    background-color: lightgrey;
} */
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
}</style>
</head>
<body bgcolor="#E0E0E0">
<nav class="navbar navbar-dark bg-dark">
  

<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="navbar-brand" href="/"><img src="logo1.png" height="42" width="42" >   Media Library</a>
  </li>
  </ul>
  </nav>
      
   
<br>
<br>
<h1><font color="red"><b><center>CREATE YOUR PROFILE</center></b></font></h1><br>
 <div style="width:800px; margin:0 auto;"><center><form action="/upload" method="post" enctype="multipart/form-data">
<b><center><font size="6">Upload profile Photo:</font></b><br><input type="file" name="file" id="uploadImage"/></center>
<br>
<br>
<b><center><font size="6">Enter Description:</font></b><br><input type="text" name="desc" /></center>
<br>
<br>
<center><input type="Submit" class="button" id="upload"/> </center>
</p>
</form>  
 </center>
 </div>
</body>
</html>