<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DisplayApplication</title>
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
			<div class="alert alert-danger">
				<strong>Error!</strong> ${error}
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
			<h1>Login</h1>
		</div>
	</div>
	
	<div class="section">
	<div class="container" style="margin-left: 200px; margin-top: 100px">

		<div class="col-md-5 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong class="">Register</strong>

				</div>
				<div class="panel-body">
					<form:form class="form-horizontal" role="form"
						modelAttribute="user">


						<div class="form-group">
							<label class="col-sm-3 control-label">First Name</label>
							<div class="col-sm-9">
								<form:input class="form-control" path="firstname"
									required="required" />
								<form:errors path="firstname" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Last Name</label>
							<div class="col-sm-9">
								<form:input class="form-control" path="lastname" required="" />
								<form:errors path="lastname" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Username</label>
							<div class="col-sm-9">
								<form:input class="form-control" name="username" path="username"
									required="" />
								<form:errors path="username" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Password</label>
							<div class="col-sm-9">
								<form:input class="form-control" path="password" required="" />
								<form:errors path="password" />
							</div>

						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm">Register</button>
								<button type="reset" class="btn btn-default btn-sm">Reset</button>
							</div>
						</div>
						<div>
							<div class="col-md-5 col-md-offset-4">
								<a href="Login.html">Back to Login</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>