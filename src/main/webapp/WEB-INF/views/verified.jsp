<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>thankyou</title>

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
	<link href="css/style_1.css" rel="stylesheet" type="text/css"/>
	<link href="css/header.css" rel="stylesheet" type="text/css"/>
	<link href="css/footer.css" rel="stylesheet" type="text/css"/>
	
</head>
<body>
	
	<%@ include file="header_2.jsp" %>
	
	<!-- Body -->

		<!--  Wording  -->
		<div class="container-fluid text-center">
			<p id="regTag">Welcome to the Community!</p>
		</div>
		
		<!-- Registration Form -->
		<div id="regForm" class="container-fluid align-content-center">
			<div class="container bg-white py-3 text-center regForm" style="width:30%; border-radius: 10px">
										
				<h1>Verified</h1>
    			<p>Welcome to community <br> your account has been verified</p>
				<div class="container-fluid p-0" style="margin-top: 20px">
					<a href="login" class="btn btn-block text-white sign-in mt-6">Continue</a>
				</div>
			</div>
		</div>
		
	<%@ include file="footer.jsp" %>

</body>
</html>