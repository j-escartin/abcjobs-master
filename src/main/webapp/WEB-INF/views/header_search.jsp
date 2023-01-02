<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid p-0 m-0 row bg-white">
		<div class="col-sm-6 p-0 m-0 text-center row align-items-center">
			<div class="col-sm-4 m-0 p-0 text-right">
				<img alt="Logo" src="images/logo.png" id="logo">
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
						<a class="nav-link text-white" href="logout">Log out</a>
					</li>
				</ul>
			</div>
		</div>
	</div> 
    