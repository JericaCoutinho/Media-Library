<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background-color: #111;
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
<body>

<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><img src="logo1.png" height="42" width="42" >   Media Library</a>
    </div>
    <ul class="nav navbar-nav">
       <li class="active"><a href="/">Home</a></li>
    </ul>
  </div>
</nav>
<div class="sidenav">
	 <script>
	 function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);
		    // The response object is returned with a status field that lets the
		    // app know the current login status of the person.
		    // Full docs on the response object can be found in the documentation
		    // for FB.getLoginStatus().
		    if (response.status === 'connected') {
		      // Logged into your app and Facebook.
		      testAPI();
		    } else {
		      // The person is not logged into your app or we are unable to tell.
		      document.getElementById('status').innerHTML = 'Please log ' +
		        'into this app.';
		    }
		  }

		  // This function is called when someone finishes with the Login
		  // Button.  See the onlogin handler attached to it in the sample
		  // code below.
		  function checkLoginState() {
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });
		  }

		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '365959097244055',
		      cookie     : true,  // enable cookies to allow the server to access 
		                          // the session
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v2.8' // use graph api version 2.8
		    });

		    // Now that we've initialized the JavaScript SDK, we call 
		    // FB.getLoginStatus().  This function gets the state of the
		    // person visiting this page and can return one of three states to
		    // the callback you provide.  They can be:
		    //
		    // 1. Logged into your app ('connected')
		    // 2. Logged into Facebook, but not your app ('not_authorized')
		    // 3. Not logged into Facebook and can't tell if they are logged into
		    //    your app or not.
		    //
		    // These three cases are handled in the callback function.

		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });

		  };

		  // Load the SDK asynchronously
		  (function(d, s, id) {
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) return;
		    js = d.createElement(s); js.id = id;
		    js.src = "https://connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		  }(document, 'script', 'facebook-jssdk'));

		  // Here we run a very simple test of the Graph API after login is
		  // successful.  See statusChangeCallback() for when this call is made.
   function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me?fields=id,name,email', function(response) {
      console.log("dhsj"+response);
  /*     document.getElementById('status').innerHTML =
         'Thanks for logging in, ' + response.name + '!';  */
      $('[name="myId"]').val(response.id);
      $('[name="myName"]').val(response.name);
      $('[name="myFriends"]').val(response.email);
      
      FB.api('/me/friends', function(response){
      	console.log(response);
      	//Append the data
      	response.data.forEach(function(ele,i){
      		$("#tableBody").append(
      				'<tr><th scope="row">'+i+'</th>'+
      				'<td>'+ ele.name + '</td>' + 
      				'<td>'+ ele.id +'</td>' +  
      				'</tr>'
      				);
      		var earlierVal = $('[name="myFriends"]').val();
      		$('[name="myFriends"]').val(earlierVal + ele.id + "/" + ele.name + "/");
      	
      	});
      	//$("#redirectForm").submit();
      });
    });
   }
    
    </script>
	



<div class="paragraphs">
<div class="row">
<div class="span4">
 
    
        	<img style="float:left" src="${imgSrc}"  height="300" width="300" alt="Profile Page Image">
            
       
      
  <div class="container">
<div class="row">  
    <div class="media-body">
      <h4 class="media-heading"><b><%=session.getAttribute("name")%></b></h4>
      <br><p style="clear:both">  Hi, I am a Computer Science Graduate Student at SUNY Albany. This is my Software Engineering homework assignment 2.</p>
    </div>
  </div>
 </div>
      
      </div>
      </div>
</div>
<h1><i>List of User's Friends</i></h1>
</div>
<div class"container">
	<div class="row">
		<table class="table table-bordered">
  			<thead class="thead-dark">
   				 <tr>
      				<th  scope="col">Id</th>
      				<th  scope="col">Name</th>
      				<th  scope="col">User ID</th>
      				
    			</tr>
 			 </thead>
 			 	<tbody id="tableBody">
 			 	
 			 	</tbody>
  		</table>
	</div>
</div>
  




</body>
</html>