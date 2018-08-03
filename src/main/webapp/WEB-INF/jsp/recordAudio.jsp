<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Audio-only</title>
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <link href="https://vjs.zencdn.net/6.6.3/video-js.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/videojs-record/2.1.0/css/videojs.record.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/6.7.2/video.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/RecordRTC/5.4.6/RecordRTC.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/adapterjs/0.15.0/adapter.min.js"></script>
<script src="https://collab-project.github.io/videojs-record/dist/wavesurfer.min.js"></script>
<script src="https://collab-project.github.io/videojs-record/dist/wavesurfer.microphone.min.js"></script>
<script src="https://collab-project.github.io/videojs-record/dist/videojs.wavesurfer.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-record/2.1.2/videojs.record.min.js"></script>

  <style>
  /* change player background color */
  #myAudio {
      background-color: #9FD6BA;
  }
  
   /* change player background color */
  #myImage {
      background-color: #efc3e6;
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
}

  </style>
</head>
<body>
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

<font color="red" size="5"><b><center>RECORD AUDIO:</center></b></font>
<br>
<center><audio id="myAudio" class="video-js vjs-default-skin"></audio></center>
<font color="red"size="5"><b><center>CAPTURE PHOTO:</center></b></font>
<br>
<center> <video id="myImage" class="video-js vjs-default-skin"></video></center>

<script>
<!--Audio Script-->
var player = videojs("myAudio", {
    controls: true,
    width: 600,
    height: 300,
    plugins: {
        wavesurfer: {
            src: "live",
            waveColor: "#36393b",
            progressColor: "black",
            debug: true,
            cursorWidth: 1,
            msDisplayMax: 20,
            hideScrollbar: true
        },
        record: {
            audio: true,
            video: false,
            maxLength: 20,
            debug: true
        }
    }
}, function(){
    // print version information at startup
    videojs.log('Using video.js', videojs.VERSION,
        'with videojs-record', videojs.getPluginVersion('record'),
        '+ videojs-wavesurfer', videojs.getPluginVersion('wavesurfer'),
        'and recordrtc', RecordRTC.version);
});

// error handling
player.on('deviceError', function() {
    console.log('device error:', player.deviceErrorCode);
});

// user clicked the record button and started recording
player.on('startRecord', function() {
    console.log('started recording!');
});

// user completed recording and stream is available
player.on('finishRecord', function() {
    // the blob object contains the recorded data that
    // can be downloaded by the user, stored on server etc.
    console.log('finished recording: ', player.recordedData);
	var reader= new FileReader();
	var base64data;
	reader.readAsDataURL(player.recordedData);
	reader.onloadend = function(){
		base64data = reader.result;
		console.log(base64data);
		$("#recording").val(base64data);
		
	}
});

  <!-- Image Script-->
var player2 = videojs("myImage", {
    controls: true,
    width: 320,
    height: 240,
    controlBar: {
        volumePanel: false,
        fullscreenToggle: false
    },
    plugins: {
        record: {
            image: true,
            debug: true
        }
    }
}, function(){
    // print version information at startup
    videojs.log('Using video.js', videojs.VERSION,
        'with videojs-record', videojs.getPluginVersion('record'));
});

// error handling
player2.on('deviceError', function() {
    console.warn('device error:', player2.deviceErrorCode);
});

// snapshot is available
player2.on('finishRecord', function() {
    // the blob object contains the image data that
    // can be downloaded by the user, stored on server etc.
    console.log('snapshot ready: ', player2.recordedData);
    $('#image').val(player2.recordedData);
});


 
<!--Save button-->
	$(document).ready(function(){
		$("#saveButton").on("click",function(){
			//alert("called");
			$("#audioForm").submit();
		});
	});
	
</script>

<form id="audioForm" action="/base64Audio" method="post" enctype="multipart/form-data" >
	
	<br><input type="hidden" id="recording" name="recording"/>
	<br><input type="hidden" id="image" name="image" />
	<!-- <font size="5">Upload Photo:</font></b><br><input type="file" name="file" id="uploadImage"/> -->
	  <br><center><b><font color="red" size="5">ENTER DESCRIPTION:</font></b><br><input type="text" name="pdescription" /></center><br>
	<center><button class="button" id="saveButton">Save</button></center>
	</form>
	

</body>
</html>
