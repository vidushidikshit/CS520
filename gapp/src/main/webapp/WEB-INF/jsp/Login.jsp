<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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
		<c:when test="${not empty message}">
			<div class="alert alert-warning">
				<strong>Warning!</strong> ${message}
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
						<strong class="">Login</strong>

					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form"
							modelAttribute="user">
							<div class="form-group ">

								<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
								<div class="col-sm-9">
									<form:input type="email" class="form-control" id="inputEmail3"
										placeholder="Email" name="username" required="required"
										path="username" />
									<form:errors path="username" />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
								<div class="col-sm-9">
									<form:input type="password" class="form-control"
										id="inputPassword3" placeholder="Password" name="password"
										 path="password"  required="required"/>
									<form:errors path="password" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<div class="checkbox">
										<label class=""> <input type="checkbox" class="">Remember
											me
										</label>
									</div>
								</div>
							</div>
							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-success btn-sm">Sign
										in</button>
									<button type="reset" class="btn btn-default btn-sm">Reset</button>
								</div>
							</div>
						</form:form>
					</div>
					<div class="panel-footer">
						Not Registered? <a href="Register.html" class="">Register here</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>