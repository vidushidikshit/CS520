<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staff</title>
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

			<p>Hello Staff!</p>


			<a href="logout.html" style="color: green;">Logout</a>

		</div>
	</div>


	<div class="container" style="float: left; margin-top: 50px;">
		<div class="col-md-3 ">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong class="">Staff Roles</strong>
				</div>
				<div class="panel-body">
					<form:form class="form-horizontal" role="form"
						modelAttribute="user">
						<div class="form-group last">
							<br>
							
						</div>
					</form:form>
				</div>
				<div class="panel-footer"></div>
			</div>
		</div>

		<div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<strong class="">Welcome!</strong>
					</div>
					<div class="form-group"></div>
					<p style="font-size: large; font-style: italic; color: red">Welcome!
						You may select the options from Staff Roles</p>

					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>