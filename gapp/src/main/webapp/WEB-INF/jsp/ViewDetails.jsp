<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ViewDetails</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel='stylesheet' type='text/css' href="css.css" />
</head>
<body>
	<div class="header">
		<div class="header-text">
			<h1>Graduate Admission Application</h1>
		</div>
	</div>

	<div class="header1">
		<div class="font">
			
				<p>Hello ${sessionScope.user1.firstname}!</p>
			
		
				<a href="logout.html">Logout</a>
			
		</div>
	</div>
	<div class="section">
	<div class="container" style="float: left; margin-top: 50px;">
			<div class="col-md-3 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong class="">Admin Roles</strong>
					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form"
							modelAttribute="user">
							<div class="form-group last">
								<br>
								<div class="col-sm-offset-3 col-sm-9">
									<a href="ViewDepartments.html" style="font-size: medium;">View Departments</a> <br> <a
										href="AddDepartment.html" style="font-size: medium;">Add Department</a><br>
										 <a href="Add.html" style="font-size: medium;">Add/Edit</a><br> 
										  <a href="#" style="font-size: medium;">Applications</a><br> 		
										   <a href="#" style="font-size: medium;">Users</a><br>
										   <a href="Admin.html" style="font-size: medium;">Go to Home Page</a><br>
								</div>
							</div>
						</form:form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
		<div style="margin-top: 60px">
		<div class="col-md-9 " style="width: 1000px">
			<div class="panel panel-primary">
			<div class="panel-heading">
				<strong class="">View Department</strong>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" role="form" modelAttribute="user">
					<div class="cpl-span-2">
					<table class="table table-bordered"  >
						<caption class="bg-info" style="font: bold; font-size: small;">Department
							List</caption>
						<thead>
							<tr>
								<th>Department Id</th>
								<th>Department</th>
								<th># Programs</th>

							</tr>
						</thead>
						<tbody>

							<tr>
								<td>${dept.dept_id}</td>
								<td>${dept.dept_name }</td>
								<td>${dept.programs.size()}</td>
							</tr>

						</tbody>
					</table>
					</div>
					<div class="col-span-2" style="float: left;">
						<table class="table table-bordered" style="float: left;width: 935px">
							<caption class="bg-info" style="font: bold; font-size: small;">Program
								List</caption>
							<thead>
								<tr>
									<th>Program Id</th>
									<th>Program Name</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dept.programs}" var="prg">
									<tr>
										<td>${prg.prg_id}</td>
										<td>${prg.prg_name}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-span-2" style="float: left;">
						<table class="table table-bordered" style="float: left;width: 935px">
							<caption class="bg-info" style="font: bold; font-size: small;">Additional
								Requirements List</caption>
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Type</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dept.er}" var="er">
									<tr>
										<td>${er.rec_id}</td>
										<td>${er.rec_name}</td>
										<td>${er.rec_type}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
				</form:form>
			</div>
			<div class="panel-footer">
			</div>
		</div>
	</div>
	</div>

</body>
</html>