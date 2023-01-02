<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
	<link href="css/login.css" rel="stylesheet" type="text/css"/>
	<link href="css/footer.css" rel="stylesheet" type="text/css"/>
	<link href="css/header.css" rel="stylesheet" type="text/css"/><link href="css/abc_jobs.css" rel="stylesheet" type="text/css"/>
	
</head>

<body>
	
	<%@ include file="header.jsp" %>
<!-- Body -->

	<div class="container-fluid m-0 p-0 row align-items-center" id="bodyContainer">
	
		<!-- Developer's Image -->
		<div class="col-sm-6 text-center p-0 m-0 row align-items-center">
			<div class="col-sm-12 p-0 m-0">
				<img alt="developer" src="images/Home.png" id="developer">
			</div>
		</div>
		
		<!-- Login Page -->
		<div class="col-sm-6 p-0 m-0 text-center justify-content-center">
			<h1>Welcome Developer</h1>
			<p id="tagline" class="mb-5">Believe Bigger. Aim Higher!<p>
			<div class="container" style="width:80%">
				<div class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? "d-none" : "d-block" }" role="alert">
  					${ message }
				</div>
				<div class="alert alert-success alert-dismissible fade show my-3 ${ scMessage == null ? " d-none" : "d-block" }" role="alert">
			      ${ scMessage }
			    </div>
				<form:form action="login" method="post" modelAttribute="login">
					<div class="form-group">
						<input class="form-control" type="email" name="email"
						 id="emailAddress" placeholder="Email" required/>
					</div>
					<div class="form-group">
						<input class="form-control" type="password" name="password"
						 id="password" placeholder="Password" required/>
					</div>
					<ul class="nav justify-content-center m-0 p-0">
						<li class="nav-item pr-2 nav-header" style="border-right: 3px solid #AACF42" >
							<a class="nav-link text-body" href="forgotPassword">Forgot Password?</a>
						</li>
						<li class="nav-item pl-2 nav-header">
							<a class="nav-link text-body" href="registration">No Account Yet?</a>
						</li>
					</ul>
					<div class="container-fluid p-0" style="margin-top: 20px">
						<button type="submit" class="btn btn-block text-white sign-in">Sign in</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<script src="js/validation.js"></script>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>