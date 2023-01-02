<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
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
	<link href="css/registration.css" rel="stylesheet" type="text/css"/>
	<link href="css/footer.css" rel="stylesheet" type="text/css"/>
	<link href="css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<%@ include file="header_search.jsp" %>
		<div id="regForm">
			<div class="container">
				<div class="container align-items-center mt-5" style="width:60%">
					<h1>${notFound == true ? "Not Found" : ""}</h1>
					<c:forEach var="s" items="${selected}">
					<div class="card bg-white p-0 mb-2">
								<div class="card-body px-0 py-3">
									<div class="container row m-0 align-items-center">
										<div class="col-sm-4 m-0 p-0 text-center">
											<img alt="profile" src="images/jack.png" width="70px" height="70px"/>
										</div>
										<div class="col-sm-5 m-0 p-0">
										<p class="m-0 fontText" style="font-weight: bold">${s.getFirstName()} ${s.getLastName() }</p>
											<p class="m-0 fontText">${s.getTitle()}</p>
										</div>
										<div class="col-sm-3 m-0 p-0 text-center">
										<form action="result" method="post" class="ms-auto">
											<input type="hidden" name="uId" value="${s.getUserId()}">
											<button type="submit" class="btn btn-outline-success ms-auto"> View Profile</button>
										</form>
										</div>
									</div>
								</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>