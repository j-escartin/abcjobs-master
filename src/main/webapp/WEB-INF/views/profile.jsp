<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewProfile</title>

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
	
	<!-- Css -->
	<link href="css/style_2.css" rel="stylesheet" type="text/css"/>
	<link href="css/footer.css" rel="stylesheet" type="text/css"/>
	<link href="css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<%@ include file="header_search.jsp" %>
	<!-- Body -->
	<div class="container">
	<form:form modelAttribute="profile" action="profile" method="post">
		
	 <div class="fluid-container row p-0" style="margin-top:40px">
	 	<div class="col-sm-8 row align-items-right m-0 p-0">
	 		<div class="col-sm-3 p-0 m-0"></div>
	 		<div class="bg-white col-sm-9 p-0 m-0 container"  style="border-radius: 10px">
	 		    <div class="alert alert-success alert-dismissible fade show ${message == null ? " d-none" : "d-flex" }"
                role="alert">
                ${message}
            	</div>
	 			<img alt="cover" src="images/Cover.png" width="100%" style="border-radius: 10px 10px 0 0">
	 			<img alt="profile" src="images/profile.png" width="125px" height="125px" id="viewProfile"/>
	 			<div class="viewDes">
	 				<div class="container-fluid row p-0 m-0">
	 					<div class="col-sm-8">
								<h3 class="fontText">Name</h3>
							    <p>${fullName }</p>
							    <hr>
							  	<h3 class="fontText">Title</h3>
							  	<p>${title}</p>
							   <hr>
							   <h3 class="fontText">About Me:</h3>
							   <p>${about}</p>
							   <hr>
							   <h3 class="fontText">Company:</h3>
							    <p>${company}</p>
							   <hr>
							   <h3 class="fontText">Website:</h3>
							    <p>${website}</p>
							   <hr>
							   <h3 class="fontText">Email:</h3>
							   <p>${email}</p>
	 					</div>
	 					<div class="col-sm-4 text-center">
	 					
	 					<!-- Button for Modal Edit Profile -->
	 						<a href="updateProfile" class="btn">
	 							<img  alt="edit-icon" src="images/edit.png"  width="30px" height="30px"> <br>
	 							<span class="fontText" style="color: #469846">Edit Profile</span>
	 						</a>
	 						
	 					</div>
	 				</div>
	 			</div>
	 		</div>
	 		
	 		<div class="col-sm-3 p-0 m-0"></div>
	 		<div class="bg-white col-sm-9 p-0 mt-4 container"  style="border-radius: 10px">
	 			<h3 class="ml-3 fontText">Experience:</h3>
                        <div id="experiencesMD"></div>
                        <c:forEach var="e" items="${ex}">
                            <div class="d-flex align-items-center">
                                <i class='bx bx-map-pin fs-2'></i>
                                <div class="p-3">
                                    <h4>${e.getPosition()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                                    <small>${e.getCompanyName()}</small>
                                </div>
                            </div>
                        </c:forEach>  
	 		</div>
	 		<div class="col-sm-3 p-0 m-0"></div>
	 		<div class="bg-white col-sm-9 p-0 mt-4 container"  style="border-radius: 10px">
	 			<h3 class="ml-3 fontText">Education:</h3>
                        <div id="educationsMD"></div>
                        <c:forEach var="e" items="${ed}">
                            <div class="d-flex align-items-center">
                                <i class='bx bx-map-pin fs-2'></i>
                                <div class="p-3">
                                      <h4>${e.getEducationName()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                                    <small>${e.getIntitutionName()}</small>
                                </div>
                            </div>
                        </c:forEach>  
	 		</div>
	 	</div>
	 	<%@ include file="sideBar.jsp" %>
	 	</div>
	 	</form:form>
	</div>
<script src="js/profile.js"></script>
</body>
</html>