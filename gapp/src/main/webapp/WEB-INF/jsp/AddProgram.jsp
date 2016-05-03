<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Program</title>
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
	<c:choose>
		<c:when test="${not empty error}">
			<div class="alert alert-warning">
				<strong>Warning!</strong> ${error}
			</div>
		</c:when>
	</c:choose>
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
					<strong class="">Add Program</strong>

				</div>
				<div class="panel-body">
					<form:form class="form-horizontal" role="form"
						modelAttribute="prg">


						<div class="form-group">
							<label class="col-sm-3 control-label">Program Name</label>
							<div class="col-sm-9">
								<form:input class="form-control" path="prg_name"
									required="required" /><form:errors path="prg_name" />
							</div>
						</div>

						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm">Add</button>
								<button type="reset" class="btn btn-default btn-sm">Reset</button>
							</div>
						</div>
						<div></div>
						<input type="hidden"   name="dept_id" 
									 value="${dept_id}"/>
					</form:form>
				</div>
				<div class="panel-footer">
				</div>
			</div>
		</div>
	</div>
	
	<div style="margin-top: 60px">
		<div class="col-md-9 ">
			<div class="panel panel-primary" style="min-width: 900px;">
				<div class="panel-heading">
					<strong class="">View Departments</strong>
				</div>
				<div class="panel-body">
					<form:form class="form-horizontal" role="form"
						modelAttribute="user">
						<div style="float: left; font-size: x-large;">
							<p>Department Name: ${dept.dept_name }</p>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9"></div>
						</div>

						<table class="table table-bordered">
							<caption class="bg-info" style="font: bold; font-size: small;">Department
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
					</form:form>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>
	
</body>
</html>