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
	 <div class="container bg-white p-0 my-3" style="margin-top:40px">
	 <div class="alert alert-danger alert-dismissible fade show ${error == null ? "d-none" : "d-block"}" role="alert">
	 	${error}
	 </div>
	<div class="alert alert-success alert-dismissible fade show my-3 ${ success == null ? " d-none" : "d-block" }" role="alert">
		${success}
	</div>
	 	<table class="table table-hover">
		 	<thead>
		 		<tr>
		 			<th scope="col">#</th>
		 			<th scope="col">Full Name</th>
		 			<th scope="col">Email</th>
		 			<th scope="col">Title</th>
		 			<th scope="col">Action</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<% int i = 1; %>
		 		<c:forEach var="user" items="${users}">
		 			<tr>
		 				<th scope="row"><%= i ++ %></th>
		 				<td>${user.getFirstName()} ${user.getLastName()}</td>
		 				<td>${user.getUser().getEmail()}</td>
		 				<td>${user.getTitle() == null ? "-" : user.getTitle()} </td>
		 				<td>
		 					<a href="profile/${user.getUserId()}" >Edit</a>
		 					<a href="" data-toggle="modal" data-target="#deleteModal">Delete</a>
		 					<a href="" data-toggle="modal" data-target="#detailModal${user.getUserId()}">Detail</a>
		 				</td>
		 			</tr>
		 			 <!-- delete confirmation -->
				<div class="modal fade" id="deleteModal" style="z-index: 2000;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Delete ${user.getFirstName()}</h1>
				        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        You want to really delete this user?
				      </div>
				      <div class="modal-footer">
				        <a href="delete/${user.getUserId()}" class="btn btn-outline-danger">Delete</a>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- detail -->
				 <div class="modal fade" id="detailModal${user.getUserId()}" style="z-index: 2000;">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Detail</h1>
				        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <ul class="list-group list-group-flush">
				          <li class="list-group-item">
				            <h4>First Name</h4>
				            <p>${user.getFirstName()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Last Name</h4>
				            <p>${user.getLastName()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Title</h4>
				            <p>${user.getTitle()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>About</h4>
				            <p>${user.getAbout()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Company Name</h4>
				            <p>${user.getCompanyName()}</p>
				          </li>
				          <li class="list-group-item">
				            <h4>Website</h4>
				            <a href="">${user.getWebsite()}</a>
				          </li>
				        </ul>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
			  	</div>
			   </div>
		 		</c:forEach>
		 	</tbody>
	 	</table>
	 	
	 		
		
	 </div>	 	
</body>
</html>