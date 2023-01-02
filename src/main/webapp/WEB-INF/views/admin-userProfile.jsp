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
	
	<!-- CSS -->
	<link href="../css/style_2.css" rel="stylesheet" type="text/css"/>
	<link href="../css/footer.css" rel="stylesheet" type="text/css"/>
	<link href="../css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<div class="container-fluid p-0 m-0 row bg-white">
		<div class="col-sm-6 p-0 m-0 text-center row align-items-center">
			<div class="col-sm-4 m-0 p-0 text-right">
				<img alt="Logo" src="../images/logo.png" id="logo">
			</div>
			<div class="col-sm-8 p-0 m-0 text-left">
				<nav class="navbar navbar-light">
					<form class="form-inline" action="search" method="get">
						<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
							name="q" value="<%= request.getParameter("q") != null ? request.getParameter("q"): "" %>"
							style="font-family: 'Gentium Book Basic', serif;">
						<button class="btn btn-outline-success my2 my-sm-0 material-symbols-outlined" 
						style="font-weight:bold" type="submit">Search</button>
					</form>
					
				</nav>
			</div>
		</div>
		<div class="col-sm-6 p-0 m-0 row align-items-center text-center">
			<div class="col-sm-12 m-0 pl-3">
				<ul class="nav  p-0 m-0 justify-content-center">
					<li class="nav-item px-3 nav-header">
						<a class="nav-link text-body" href="#discover">Discover</a>
					</li>
					<li class="nav-item px-3 nav-header">
						<a class="nav-link text-body" href="#jobs">Jobs</a>
					</li>
					<li class="nav-item px-3 nav-header" style="border-right: 3px solid #AACF42">
						<a class="nav-link text-body" href="#people">People</a>
					</li>
					<li class="nav-item ml-4 nav-header" id="joinBut">
						<a class="nav-link text-white" href="../logout">Log out</a>
					</li>
				</ul>
			</div>
		</div>
	</div> 
	<!-- Body -->
	<div class="container">
	<form:form modelAttribute="profile" action="../update-profile" method="post">
	 <input type="hidden" name="userDetailsId" value="${id}">	
	 <div class="fluid-container row p-0" style="margin-top:40px">
	 	<div class="col-sm-8 row align-items-right m-0 p-0">
	 		<div class="col-sm-3 p-0 m-0"></div>
	 		<div class="bg-white col-sm-9 p-0 m-0 container"  style="border-radius: 10px">
	 		    <div class="alert alert-success alert-dismissible fade show ${message == null ? " d-none" : "d-flex" }"
                role="alert">
                ${message}
            	</div>
	 			<img alt="cover" src="../images/Cover.png" width="100%" style="border-radius: 10px 10px 0 0">
	 			<img alt="profile" src="../images/profile.png" width="125px" height="125px" id="viewProfile"/>
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

	 <div class="col-sm-4 row pl-4 m-0" >
	<div class="col-sm-12 bg-white pt-2" style="border-radius:10px;height: 280px">
		<h5 class="fontText">Add Connection</h5>
		<div class="container row m-0 pb-3 align-items-center">
			<div class="col-sm-4 m-0 p-0 text-center">
				<img alt="profile" src="../images/john.png" width="70px" height="70px"/>
			</div>
			<div class="col-sm-5 m-0 p-0">
			<p class="m-0 fontText" style="font-weight: bold">John William</p>
				<p class="m-0 fontText">New York, USA</p>
			</div>
			<div class="col-sm-3 m-0 p-0 text-center">
			<img src="../images/add.png" width="25px" height="25px">
			</div>
		</div>
		<div class="container row m-0  pb-3	 align-items-center">
			<div class="col-sm-4 m-0 p-0 text-center">
				<img alt="profile" src="../images/jack.png" width="70px" height="70px"/>
			</div>
			<div class="col-sm-5 m-0 p-0">
			<p class="m-0 fontText" style="font-weight: bold">John William</p>
				<p class="m-0 fontText">New York, USA</p>
			</div>
			<div class="col-sm-3 m-0 p-0 text-center">
			<img src="../images/add.png" width="25px" height="25px">
			</div>
		</div>
		<p class="fontText m-0" style="color:#469846">Connection:</p>
		<p class="fontText m-0" style="color:#469846">Followers:</p>
			<div class="container-fluid">
		<ul class="nav p-0 mt-3 justify-content-center">
			<li class="nav-item nav-footer">
				<a class="nav-link text-body px-1" href="#about">About</a>
			</li>
			<li class="nav-item nav-footer">
				<a class="nav-link px-1 text-body" href="#accessibility">Accessibility</a>
			</li>
			<li class="nav-item nav-footer">
				<a class="nav-link px-1 text-body" href="#cookiePolicy">Cookie Policy</a>
			</li>
		</ul>
		<ul class="nav p-0 m-0 justify-content-center">
			<li class="nav-item nav-footer">
				<a class="nav-link text-body pt-0 px-1" href="#privacyPolicy">Privacy Policy</a>
			</li>
			<li class="nav-item nav-footer">
				<a class="nav-link px-1 pt-0 text-body" href="#userAgreement">User Agreement</a>
			</li>
		</ul>
		<ul class="nav p-0 m-0 justify-content-center">
			<li class="nav-item nav-footer">
				<a class="nav-link text-body pt-0 px-3" href="#copyrightprivacyPolicy">Copyright Policy</a>
			</li>
			<li class="nav-item nav-footer">
				<a class="nav-link pt-0 px-3 text-body" href="#Guidelines">Guidelines</a>
			</li>
		</ul>
		<div class="container-fluid row align-items-center">
			<div class="col-sm-4 m-0 p-0 text-right">
				<img alt="Logo" src="../images/logo.png" width="50px" height="50px">
			</div>
			<div class="col-sm-8 m-0 p-0 text-left">
				<p class="p-0 m-0" id="LogoWordFooter">ABC JOBS <span>&copy;</span> 2022</p>
			</div>
		</div>
		
		</div>
	</div>	
</div>
	 </div>
	 </form:form>
	</div>
</body>

</html>