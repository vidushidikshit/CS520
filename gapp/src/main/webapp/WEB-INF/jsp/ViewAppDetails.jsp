<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View App Details</title>
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
		<div class="container" style="float: left; margin-top: 50px;">
			<div class="col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong class="">Student Roles</strong>
					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form"
							modelAttribute="user">
							<div class="form-group last">
								<br>
								<div class="col-sm-offset-3 col-sm-9">
									<a href="Student.html" style="font-size: medium;">View
										Applications</a> <br>
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
				<div class="panel panel-primary">
					<div class="panel-heading">
						<strong class="">View Application Details</strong>
					</div>
					<div class="panel-body">
						<form:form class="form-horizontal" role="form"
							modelAttribute="applicant">

							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9"></div>
							</div>

							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<h4 class="panel-title">
											<a role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseOne"
												aria-expanded="true" aria-controls="collapseOne"> Basic
												Info </a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-sm-3 control-label">Application Id</label>
												<div class="col-sm-9">
													<label class="control-label">${application.application_id }</label>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">Term</label>
												<div class="col-sm-9">
													<label class="control-label">${application.term }</label>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">Department</label>
												<div class="col-sm-9">
													<label class="control-label">${application.dept.dept_name }</label>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">Program Name</label>
												<div class="col-sm-9">
													<label class="control-label">${application.program.prg_name }</label>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-3 control-label">First Name</label>
												<div class="col-sm-9">
													<label class="control-label">${application.fname }</label>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">Last Name</label>
												<div class="col-sm-9">
													<label class="control-label">${application.lname }</label>
												</div>
											</div>

											<c:choose>
												<c:when test="${not empty application.CIN }">
													<div class="form-group">
														<label class="col-sm-3 control-label">CIN</label>
														<div class="col-sm-9">
															<label class="control-label">${application.CIN }</label>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="form-group">
														<label class="col-sm-3 control-label">CIN</label>
														<div class="col-sm-9">
															<label class="control-label"></label>
														</div>
													</div>
												</c:otherwise>
											</c:choose>

											<div class="form-group">
												<label class="col-sm-3 control-label">Phone No.</label>
												<div class="col-sm-9">
													<label class="control-label">${application.phone}</label>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">Email</label>
												<div class="col-sm-9">
													<label class="control-label">${application.email}</label>
												</div>
											</div>

											<c:choose>
												<c:when test="${application.gender ==false}">
													<div class="form-group">
														<label class="col-sm-3 control-label">Gender</label>
														<div class="col-sm-9">
															<label class="control-label">Female</label>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div class="form-group">
														<label class="col-sm-3 control-label">Gender</label>
														<div class="col-sm-9">
															<label class="control-label">Male</label>
														</div>
													</div>
												</c:otherwise>
											</c:choose>

											<div class="form-group">
												<label class="col-sm-3 control-label">Date Of Birth</label>
												<div class="col-sm-9">
													<label class="control-label"><fmt:formatDate
															pattern="M-d-yyyy" value="${application.dob}" /></label>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label">Citizenship</label>
												<div class="col-sm-9">
													<label class="control-label">${application.citizenship}</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingTwo">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseTwo"
												aria-expanded="false" aria-controls="collapseTwo">
												Educational Background </a>
										</h4>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingTwo">
										<c:forEach items="${application.degree}" var="degree">
										<div class="panel-body">
											
											<div class="form-group">
												<label class="col-sm-3 control-label">College/University</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.university }</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">Time Period Attended</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.time_period }</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">Degree</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.degree }</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">Major</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.major }</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">Minor</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.minor }</label>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label">GPA Earned</label>
												<div class="col-sm-9">
													<label class="control-label">${degree.gpa }</label>
												</div>
											</div>
											
											<div class="form-group">
											<label class="col-sm-3 control-label">Transcript</label>
											<div class="col-sm-9">
												<label class="control-label"><a href="download.html?ebid=${degree.ebid}">${degree.filename}</a></label>
											</div>
										</div>
											
											
											
										</div>
										</c:forEach>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingThree">
										<h4 class="panel-title">
											<a class="collapsed" role="button" data-toggle="collapse"
												data-parent="#accordion" href="#collapseThree"
												aria-expanded="false" aria-controls="collapseThree">
												Academic Records </a>
										</h4>
									</div>
									<div id="collapseThree" class="panel-collapse collapse"
										role="tabpanel" aria-labelledby="headingThree">
										<div class="panel-body"></div>
										<div class="form-group">
											<label class="col-sm-3 control-label">Toefl</label>
											<div class="col-sm-9">
												<label class="control-label">${application.toefl }</label>
											</div>
										</div>
										
										<div class="form-group">
										<c:forEach items="${application.er_value}" var="er">
												<c:choose>
												<c:when test="${er.extrarec.rec_type =='File' }">
												<label class="col-sm-3 control-label">${er.extrarec.rec_name}</label>
												<div style="margin-left: 200px">
												<label class="control-label"><a href="downloaderv.html?erv_id=${er.record_feild_id }">${er.fileupload_name }</a></label>
											`	</div> 
												
												</c:when>
												<c:otherwise>
											<label class="col-sm-3 control-label">${er.extrarec.rec_name}</label>
											<div class="col-sm-9">
												<label class="control-label">${er.feild_value}</label>
											</div>
											</c:otherwise>
											</c:choose>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							
						</form:form>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>