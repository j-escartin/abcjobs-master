<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dashboard</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com"/>
	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	
	<!-- CSS -->
	<link href="css/header.css" rel="stylesheet" type="text/css"/>
	<link href="css/footer.css" rel="stylesheet" type="text/css"/>
	<link href="css/registration.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<%@ include file="header_search.jsp" %>
<!-- Body -->
	 <div class="alert alert-success alert-dismissible fade show ${message == null ? " d-none" : "d-flex" }"
                role="alert">
                ${message}
     <button type="button" class="btn-close" data-dismiss="alert" aria-label="Close"></button>
     </div>
	 <div class="fluid-container row p-0" style="margin-top:40px">
	 	<div class="col-sm-4 row" >
	 		<div class="col-sm-4"></div>
	 		<div class="col-sm-8 p-0">
	 			<div class="card text-center pt-2" style="width:300px; border-radius: 10px">
		 			<div>
		 				<img alt="profile" src="images/profile.png" width="100px" height="100px"/>
		 			</div>
		 			<div class="card-body" style="border-bottom: 2px solid black">
		 				<h4 class="card-title"> ${fullName}</h4>
		 				<h6>${title}</h6>
		 				<h6>${Company}</h6>
		 				<h6 style="font-weight:bold">${About}</h6>
		 			</div>
	 				<div class="container" style="margin: 10px 0px" >
						<a href="profile" class="btn btn-block text-white sign-in mt-6">See Profile</a>
					</div>
					<c:if test="${roleId == 1}">
						<div class="container" style="margin: 10px 0px" >
							<a href="admin-homepage" class="btn btn-block text-white sign-in mt-6">Admin Dashboard</a>
						</div>
					</c:if>
	 			</div>
	 		</div>
	 	</div>
	 	
	 	<div class="col-sm-4 p-0">
	 		<div class="container bg-white row pt-1 pb-2 m-0 align-items-center" style="border-radius:10px"> 
	 			<div class="col-sm-2 p-0 m-0 text-center">
	 				<img alt="profile" src="images/profile.png" width="50px" height="50px"/>
	 			</div>
	 			<div class="col-sm-10 m-0">
	 				<input class="form-control" placeholder="Post" />
	 			</div>
	 			<div class="container-fluid text-center row mt-2 p-o" >
	 				<div class="col-sm-4">
	 					<img alt="image icon" src="images/image.png" width="40px" height="40px"/>
	 					<span class="fontText">Photo</span>
	 				</div>
	 				<div class="col-sm-4">
	 					<img alt="video icon" src="images/Video.png" width="40px" height="40px"/>
	 					<span class="fontText">Video</span>
	 				</div>
	 				<div class="col-sm-4">
	 					<img alt="Event icon" src="images/Events.png" width="40px" height="40px"/>
	 					<span class="fontText">Event</span>
	 				</div>
	 			</div>	
	 		</div>
	 		
	 		<div class="container-flex bg-white pt-2 mt-3" style="border-radius:10px">
	 				<div class="row container p-0 m-0 align-items-center" >
	 					<div class="col-sm-10 row p-0 m-0 align-items-center">
	 						<div class="col-sm-3 m-0 p-0 text-center">
	 							<img alt="profile" src="images/jane.png" width="70px" height="70px"/>
	 						</div>
	 						<div class="col-sm-9">
	 							<p class="m-0 fontText" style="font-weight: bold">Jane Jones</p>
	 							<p class="m-0 fontText">Manila, Philippines</p>
	 						</div>
	 					</div>
	 					<div class="col-sm-2 p-0 material-symbols-outlined text-center" style="font-size:40px">
	 						more_horiz
	 					</div>
	 				</div>
	 				
	 				<p class="fontText" style="margin:20px 0 0 10px">Cherishing the moments of my life.</p>
	 				<img alt="post" src="images/post.jpg" width ="100%">
	 				<div class="container-fluid row align-items-center p-0 m-0"
	 					 style="height:40px; border-bottom:2px solid black;">
	 					<div class="col-sm-12">
	 						<img src="images/react.png" width="20px" height="20px">
	 						2k Reacts
	 					</div>
	 				</div>
	 				<div class="container-fluid row align-items-center p-0 m-0 text-center" style="height:40px">
	 					<div class="col-sm-4 fontText">
	 						<img src="images/like.png" width="25px" height="25px"> Like
	 					</div>
	 					<div class="col-sm-4 fontText">
	 						<img src="images/comment.png" width="25px" height="25px"> Comment
	 					</div>
	 					<div class="col-sm-4 fontText">
	 						<img src="images/share.png" width="25px" height="25px"> Share
	 					</div>
	 				</div>
	 			</div>	
		 	</div>
		 	<%@ include file="sideBar.jsp" %>
	 	</div>	 	
</body>
</html>