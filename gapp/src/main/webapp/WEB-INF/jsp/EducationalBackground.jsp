<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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


	<c:if test="${edu.size()>0}">
		<div style="margin-top: 60px">
			<div class="col-md-9 ">
			<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Application Details</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li><a href="#">Basic Details</a></li>
      <li><a href="#"> Educational Background Details</a></li>
      <li><a href="#">Additional Academic Records</a></li>
    </ul>
  </div>
</nav>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<strong class="">Add Application Details</strong>
					</div>
					<div class="panel-body">


						<table class="table table-bordered" style="float: left;">
							<caption class="bg-info" style="font: bold; font-size: small;">Application
								List</caption>
							<thead>
								<tr>
									<th>College/University</th>
									<th>Time Period Attended(Eg. # years)</th>
									<th>Degree</th>
									<th>Major</th>
									<th>Minor</th>
									<th>GPA Earned</th>
									<th>File</th>
									<th>Operation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${edu}" var="degree">
									<tr>
										<td>${degree.university}</td>
										<td>${degree.time_period}</td>
										<td>${degree.degree }</td>
										<td>${degree.major}</td>
										<td>${degree.minor}</td>
										<td>${degree.gpa}</td>
										<td>${degree.filename}</td>
										<td><a
											href="delete.html?ebid=${degree.ebid}&application_id=${app.application_id}">
												<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete
										</a>&nbsp|&nbsp<a
											href="EditEduBack.html?ebid=${degree.ebid}&application_id=${app.application_id}">
												<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Edit
										</a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</c:if>



	<div style="margin-top: 60px; margin-left: 350px">
		<div class="col-md-9 ">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<strong class="">Add Educational Background</strong>
				</div>
				<div class="panel-body">
					<%-- <form action="doUploadFile.html" method="post"
						enctype="multipart/form-data" class="form-horizontal">
						
						<div class="form-group">
							<label class="col-sm-3 control-label">Name of File</label>
							<div class="col-sm-9">
								<input class="form-control" path="filename"
									required="required" />
							</div>
						</div> 

						<div class="form-group">
							<label class="col-sm-3 control-label">Upload Transcript </label>
							<div class="col-sm-9">
								<div class="input-group">

									<input class="form-control" type="file" name="fileUp"
										style="width: 70%" /> &nbsp<input
										class="btn btn-success btn-sm" type="submit" name="upload"
										value="Upload" />
								</div>
							</div>
						</div>

					</form> --%>

					<form:form class="form-horizontal" enctype="multipart/form-data"
						modelAttribute="educationalbackground">

						<div class="form-group">
							<label class="col-sm-3 control-label">College/University<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="university"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Time Period
								Attended(Eg. # years)<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="time_period"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Degree<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="degree"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Major<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="major"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Minor(If no minor
								course write NA)<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="minor"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">GPA Earned<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="gpa" required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Name of File<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="filename"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Upload Transcript<span style="color: red;">*</span> </label>
							<div class="col-sm-9">
								<div class="input-group">

									<input class="form-control" type="file" name="transcriptone"
										style="width: 70%" />
								</div>
							</div>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm"
									name="action" value="add">Add Another Educational
									Background</button>
							</div>
						</div>


						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm"
									name="action" value="save">Save </button>
								<a href="AdditionalRecords.html?application_id=${applicant.application_id}&user_id=${user1.user_id}" class="btn btn-success" role="button">Continue</a>
							</div>
						</div>
												<input type="hidden" value="${user1.user_id}" name="user_id">
						<input type="hidden" value="${applicant.application_id}"
							name="application_id">


					</form:form>




				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>

</body>
</html>