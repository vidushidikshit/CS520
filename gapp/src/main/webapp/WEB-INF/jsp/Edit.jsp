<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
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
	<div class="container" style="float: left;margin-top: 50px;">
			<div class="col-md-3" >
				<div class="panel panel-default" >
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
	<div class="col-md-4" style="margin-left: 350px" >
				<div class="panel panel-warning">
					<div class="panel-heading">
						<strong class="">Edit Department</strong>

					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form" modelAttribute="department">
							<div class="form-group ">

								<label class="col-sm-3 control-label">Department Name</label>
								<div class="col-sm-9">
									<form:input type="text" class="form-control" 
								  required="required"
										path="dept_name" value="${dept.dept_name}"/>
									
								</div>
							</div>
							<input type="hidden" name="dept_id" value="${dept.dept_id }">
							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-success btn-sm">Save
										</button>
									<button type="reset" class="btn btn-default btn-sm">Reset</button>
								</div>
							</div>
						</form:form>
					</div>
					<div class="panel-footer">
					
					</div>
				</div>
			</div>
		</div>
		<div style="margin-top: 60px">
		<div class="col-md-9 " >
			<div class="panel panel-primary" style="width: 1500px">
			<div class="panel-heading">
				<strong class="">View Department Details</strong>
			</div>
			<div class="panel-body">
				<form:form class="form-horizontal" role="form" modelAttribute="user">

					<div class="form-group last">
						<div class="col-sm-offset-3 col-sm-9">
						</div>
					</div>
					<div class="col-span-2" style="float: left;">
						<table class="table table-bordered" style="float: left;width: 1400px">
							<caption class="bg-info" style="font: bold; font-size: small;">Program
								List</caption>
							<thead>
								<tr>
									<th>Program Id</th>
									<th>Program Name</th>
									<th>Operation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dept.programs}" var="prg">
									<tr>
										<td>${prg.prg_id}</td>
										<td>${prg.prg_name}</td>
										<td><a href="RemovePrg.html?prg_id=${prg.prg_id}&dept_id=${dept.dept_id}" class="btn btn-primary">Remove</a></div></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-span-2" style="float: left;">
						<table class="table table-bordered" style="float: left;width: 1400px">
							<caption class="bg-info" style="font: bold; font-size: small;">Additional
								Requirements List</caption>
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Type</th>
									<th>Operation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dept.er}" var="er">
									<tr>
										<td>${er.rec_id}</td>
										<td>${er.rec_name}</td>
										<td>${er.rec_type}</td>
										<td><a href="RemoveReq.html?er_id=${er.rec_id}&dept_id=${dept.dept_id}" class="btn btn-primary">Remove</a></div></td>
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