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
	<form:form modelAttribute="profile" action="updateProfile" method="post">
		
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
	 						<div class="input-group mb-3">
							   <div class="input-group-prepend">
							    	<span class="input-group-text">Name</span>
							    </div>
							    <input type="text" class="form-control" value="${firstName}" name="firstName" id="firstName" placeholder="First Name">
							    <input type="text" class="form-control" value="${lastName}" name="lastName" id="lastName" placeholder="Last Name">
							  	</div>
							  	<h3 class="fontText">Title</h3>
							   <input type="text" class="form-control" value="${title}" name="title" placeholder="Your title">
							   <hr>
							   <h3 class="fontText">About Me:</h3>
							   <input type="text" class="form-control" value="${about}" name="about" placeholder="About Me">
							   <hr>
							   <h3 class="fontText">Company:</h3>
							   <input type="text" class="form-control" value="${company}" name="companyName" placeholder="Company">
							   <hr>
							   <h3 class="fontText">Website:</h3>
							   <input type="text" class="form-control" value="${website}" name="website" placeholder="My Website">
							   <hr>
							   <h3 class="fontText">Email:</h3>
							   <input type="email" class="form-control" value="${email}" name="email" placeholder="My Email">
	 					</div>
	 					<div class="col-sm-4 text-center">
	 					
	 					<!-- Button for Modal Edit Profile -->
	 						<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#myModal">
	 							Save Changes
	 						</button>
	 						
	 					</div>
	 				</div>
	 			</div>
	 		</div>
	 		
	 		<div class="col-sm-3 p-0 m-0"></div>
	 		<div class="bg-white col-sm-9 p-0 mt-4 container"  style="border-radius: 10px">
	 			<h3 class="ml-3 fontText">Experience:</h3>
		 			        <button type="button" class="btn btn-success ms-auto ml-3" data-toggle="modal"
                                data-target="#experiences">
                                Add Experience
                            </button>

                            <div class="modal fade" id="experiences" tabindex="-1" aria-labelledby="experiencesLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="experiencesLabel">Add Experience</h1>
                                            <button type="button" class="btn-close" data-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="position" name="position">
                                                <label for="position">Position</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="startDateEX"
                                                    name="startDateEX">
                                                <label for="startDateEX">Start Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="endDateEX" name="endDateEX">
                                                <label for="endDateEX">End Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="companyName"
                                                    name="companyNameEX">
                                                <label for="companyName">Company Name</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal"
                                                id="exBtn">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          <hr>
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
		 			        <button type="button" class="btn btn-success ms-auto ml-3" data-toggle="modal"
                                data-target="#educations">
                                Add Education
                            </button>

                            <div class="modal fade" id="educations" tabindex="-1" aria-labelledby="educationsLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="educationsLabel">Add Education</h1>
                                            <button type="button" class="btn-close" data-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="intitutionName" name="intitutionName">
                                                <label for="intitutionName">Institution Name</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="startDateED"
                                                    name="startDateED">
                                                <label for="startDateED">Start Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="endDateED" name="endDateED">
                                                <label for="endDateED">End Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="educationName"
                                                    name="educationName">
                                                <label for="educationName">Education Name Name</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal"
                                                id="edBtn">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          <hr>
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