<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Educational Background</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>
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


			<a href="logout.html" style="color: green;">Logout</a>

		</div>
	</div>


	<div class="section">
		<div class="container" style="float: left; margin-top: 50px;">
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong class="">Student Roles</strong>
					</div>
					<div class="panel-body">




						<form:form class="form-horizontal" role="form">
							<div class="form-group last">
								<br>
								<div class="col-sm-offset-3 col-sm-9">
									<a href="Student.html" style="font-size: medium;">View
										Applications</a> <br> <a href="NewApplication.html"
										style="font-size: medium;">New Applications</a> <br> <a
										href="Student.html" style="font-size: medium;">Go to Home
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
	
	
	
	<div style="margin-top: 60px ;margin-left: 350px">
		<div class="col-md-9 ">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong class="">Update Transcript</strong>
				</div>
				<div class="panel-body">
					
									
					<form class="form-horizontal" enctype="multipart/form-data" 
						action="EditEduBack.html" method="post">

						<div class="form-group">
							<label class="col-sm-3 control-label">Upload Transcript </label>
							<div class="col-sm-9">
								<div class="input-group">

									<input class="form-control" type="file"  name="transcriptone"
										style="width: 70%" /> 
								</div>
							</div>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm">Save
									& Continue</button>
								<button type="reset" class="btn btn-default btn-sm">Clear</button>
							</div>
						</div>

						<input type="hidden" value="${application_id}" 
							name="application_id">
							
						<input type="hidden" value="${ebid}" 
							name="ebid">


					</form>




				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>

</body>
</html>