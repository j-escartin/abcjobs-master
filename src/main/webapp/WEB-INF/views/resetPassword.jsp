<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forgotPassword</title>

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

	<%@ include file="header.jsp"  %>
	
	<!--  Wording  -->
	<div class="container-fluid text-center">
		<p id="regTag">Reset Password</p>
	</div>
	
	<!-- Registration Form -->
	<div id="regForm" class="container-fluid align-content-center">
		<div class="container bg-white py-3" style="width:30%; border-radius: 10px">
		<div class="alert alert-danger ${message != null ? "d-block" : "d-none"}" role="alert">
		${message}
		</div>
			<form:form action="reset" method="post">
				<div class="form-group">
					<label for="password">New Password</label>
					<input class="form-control" name="password" id="password"
								type="password" required/>
					<div class="invalid-feedback">Password required and must be match</div>
				</div>
				<div class="form-group">
					<label for="passwordConfirmation">New Password Confirmation</label>
					<input class="form-control" name="passwordConfirmation" id="passwordConfirmation"
								type="password"/>
					<div class="invalid-feedback">Password required and must be match</div>
				</div>
				<div class="container-fluid p-0" style="margin-top: 20px">
					<button type="submit" class="btn btn-block text-white sign-in mt-6" >Update Password</button>
				</div>
			</form:form>
			<div class="container-fluid p-0" style="margin-top:10px">
				<a href="login" class="btn btn-block text-body backBut">Cancel</a>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	<script src="js/validation.js"></script>
</body>
</html>