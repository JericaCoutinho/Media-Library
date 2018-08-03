 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post</title>
<style>
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
</head>
<body>
<%-- Your post!
<br>
<!--  <img style="float:left" src="${postImg}"  height="300" width="300" alt="Profile Page Image"> -->
<img src="${post.postimg}" height="300" width="300" alt="Profile Page Image"/>
<audio autoplay>
<source src="${post.postaudio}" type="audio/webm">
</audio>
<br>
 <p> ${post.postDescription} </p> 

 <br>
 
 <br> --%>
 <!--   <form action="/deletepostadmin" method="get"> -->
<%--  <input type="hidden" name="id" value="${post.postid}"/>
 <input type="text" name="comment"/>
  <button onclick="window.location.href='/delete?id=${post.postid}' ">Delete Post</button>
 <c:forEach items="${comment}" var="com">
 			 		<p>${com.comments}</p>
			</c:forEach> 
			<br>
  --%>
<c:forEach items="${post}" var="posts">
 			 		
 			 			<img src="${posts.postimg}" height="300" width="300" />
 			 			 <button class="button" onclick="window.location.href='/deletepostadmin?id=${posts.postid}' ">Delete Post</button>
 			 		</a> 
			</c:forEach>	 	
</body>
			
 <br>

</form>
</body>
</html> 