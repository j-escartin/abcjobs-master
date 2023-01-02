<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Bulk Email </title>

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
	
	<%@ include file="header_search.jsp" %>
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
			<h1>Send your Bulk Email ${adminName}!</h1>
			<p id="tagline" class="mb-5">Believe Bigger. Aim Higher!<p>
			<div class="container" style="width:80%">
					<form:form action="send-bulk" method="post" modelAttribute="sendBulk">
					    <div class="form-floating mb-3">
					      <input type="text" class="form-control" id="subject" name="emailSubject">
					      <label for="subject">Subject</label>
					    </div>
					    <div class="form-floating mb-3">
					      <textarea class="form-control" id="body" name="emailBody"></textarea>
					      <label for="body">Body</label>
					    </div>
					    <button type="submit" class="btn btn-primary">Send Message to All</button>
					  </form:form>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>