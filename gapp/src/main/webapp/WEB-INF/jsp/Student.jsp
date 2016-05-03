<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student</title>
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


			<a href="logout.html" style="color: green;">Logout</a>

		</div>
	</div>


	<div class="section">
	<div class="container" style="float: left;margin-top: 50px;">
			<div class="col-md-3" >
				<div class="panel panel-default" >
					<div class="panel-heading">
						<strong class="">Student Roles</strong>
					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form"
							modelAttribute="user">
							<div class="form-group last">
								<br>
								<div class="col-sm-offset-3 col-sm-9">
									<a href="#" style="font-size: medium;">View Applications</a> <br>
									<a href="NewApplication.html" style="font-size: medium;">New
										Applications</a> <br>
										<a href="Student.html" style="font-size: medium;">Go to Home
									Page</a><br>
								</div>
							</div>
						</form:form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
	<div>
	<div style="margin-top: 60px">
		<div class="col-md-9 ">
			<div class="panel panel-primary" >
				<div class="panel-heading">
					<strong class="">View Applications</strong>
				</div>
				<div class="panel-body">
					<form:form class="form-horizontal" role="form"
						modelAttribute="applicant">

						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9"></div>
						</div>

						<table class="table table-bordered" style="float: left;">
							<caption class="bg-info" style="font: bold; font-size: small;">Application
								List</caption>
							<thead>
								<tr>
									<th>Application Id</th>
									<th>Department Name</th>
									<th>Program Name</th>
									<th>Term </th>
									<th>Submitted On</th>
									<th>Current Status</th>
									<th>Operation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${application}" var="applications">
									<tr>
										<td>${applications.application_id}</td>
										<td>${applications.dept.dept_name }</td>
										<td>${applications.program.prg_name }</td>
										<td>${applications.term}</td>
										<td>${applications.submit_date}</td>
										<td>${applications.status.status_name}</td>
										<c:choose>
										<c:when test="${applications.status.status_name== 'Not Submitted'}">
										<td><a href="ViewAppDetails.html?application_id=${applications.application_id}"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>View
												Application Details</a>&nbsp&nbsp|&nbsp&nbsp<a href="EditApplication.html?application_id=${applications.application_id}"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Edit</a></td>
												</c:when>
												<c:otherwise>
												<td><a href="ViewAppDetails.html?application_id=${applications.application_id}"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>View
												Application Details</a></td>
												</c:otherwise>
												</c:choose>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</form:form>
				</div>
				<div class="panel-footer">

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>