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
<title>Add Additional Requirements</title>
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
<script type="text/javascript">




</script>






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



	<div style="margin-top: 60px; margin-left: 350px">
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
					<strong class="">Add Additional Requirements</strong>
				</div>
				<div class="panel-body">
					<c:set var="newval" value=""></c:set>
					`
					<c:choose>

						<c:when test="${(deptforer.er).size()>0}">
							<c:forEach items="${deptforer.er}" var="er">
								<c:choose>
									<c:when test="${er.rec_type=='File'}">
										<form action="upload.html" method="post"
											enctype="multipart/form-data" class="form-horizontal">

											<div class="input-append">
												<div class="form-group">
													<label class="col-sm-3 control-label">${er.rec_name }<span style="color: red;">*</span></label>
													<div class="col-sm-9">
														<c:set var="newval" value=""></c:set>
														<c:forEach items="${erv }" var="erv">
															<c:if test="${er.rec_id == erv.extrarec.rec_id }">
																<c:set var="newval" value="${erv.fileupload_name }"></c:set>
																<c:set var="reid" value="${erv.record_feild_id }"></c:set>
															</c:if>
														</c:forEach>

														<c:if test="${newval == ''}">
															<input class="form-control" type="file"
																style="float: left" name="fileupload1"
																required="required" value="newval" />&nbsp		
													<button type="submit" class="btn btn-success btn-sm"
																name="action" value="save1">Save</button>
														</c:if>
														<c:if test="${newval != ''}">

															<label class="control-label"><a
																href="downloaderv.html?erv_id=${reid }">${newval }</a></label><a
																href="EditAddreq.html?er=${ er.rec_id}&application_id=${app.application_id}"
																data-toggle="modal" data-target="#myFileModal"> <span
																class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Edit
															</a>



														</c:if>
													</div>
												</div>
											</div>
											<div id="myFileModal" class="modal fade" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Edit ${er.rec_name } </h4>
														</div>
														<div class="modal-body">
															<input class="form-control" type="file"
																style="float: left" name="fileupload2"
																 value="newval" />
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-success btn-sm"
																name="action" value="save3">Save</button>
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
														</div>
													</div>

												</div>
											</div>
											<input type="hidden" value="${er.rec_id}" name="rec_id">
											<input type="hidden" value="${reid}" name="reid">
											<input type="hidden" value="${app.application_id}"
												name="application_id"> <input type="hidden"
												value="${user.user_id}" name="user_id">
										</form>
									</c:when>
									<c:otherwise>
										<form:form class="form-horizontal"
											action="AdditionalRecords.html"
											modelAttribute="additionalrecords">

											<div class="input-append">
												<div class="form-group">
													<label class="col-sm-3 control-label">${er.rec_name }<span style="color: red;">*</span></label>
													<div class="col-sm-9">
														<c:set var="newval" value=""></c:set>
														<c:forEach items="${erv}" var="erv">
															<c:if test="${er.rec_id == erv.extrarec.rec_id }">
																<c:set var="newval" value="${erv.feild_value}"></c:set>
																	<c:set var="newval1" value="${erv.record_feild_id}"></c:set>
															</c:if>
														</c:forEach>
														<c:if test="${newval != ''}">
															<form:input class="form-control" path="feild_value"
																 value="${newval}" />
															<a
																href="EditAddreq.html?er=${ er.rec_id}&application_id=${app.application_id}"
																data-toggle="modal" data-target="#myModal"> <span
																class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Edit
															</a>
														</c:if>
														<c:if test="${newval == ''}">
															<form:input class="form-control" path="feild_value"
																 required="required" value="${newval}" />
															<button type="submit" class="btn btn-success btn-sm"
																name="action" value="save2">Save</button>
														</c:if>
													</div>
												</div>
											</div>
											<div id="myModal" class="modal fade" role="dialog">
												<div class="modal-dialog">

													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Edit ${er.rec_name } </h4>
														</div>
														<div class="modal-body">
															<input class="form-control" name="value"
																value="${newval}" />
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-success btn-sm"
																name="action" value="save3">Save</button>
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Close</button>
														</div>
													</div>

												</div>
											</div>
											<input type="hidden" value="${newval1}" name="record_id">
											<input type="hidden" value="${er.rec_id}" name="rec_id">
											<input type="hidden" value="${app.application_id}"
												name="application_id">
											<input type="hidden" value="${user.user_id}" name="user_id">
										</form:form>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<form:form class="form-horizontal"
								modelAttribute="additionalrecords">

								<input type="hidden" value="${app.application_id}"
									name="application_id">
								<input type="hidden" value="${user.user_id}" name="user_id">

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm"
											name="action" value="save">Save & Continue</button>
										<button type="reset" class="btn btn-default btn-sm">Clear</button>
									</div>
								</div>

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm"
											name="action" value="submit">Submit Application</button>
									</div>
								</div>


							</form:form>






						</c:when>
						<c:otherwise>

							<form:form class="form-horizontal"
								modelAttribute="additionalrecords">

								<input type="hidden" value="${app.application_id}"
									name="application_id">

								<input type="hidden" value="${user.user_id}" name="user_id">


								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm"
											name="action" value="save">Save & Continue</button>
										<button type="reset" class="btn btn-default btn-sm">Clear</button>
									</div>
								</div>

								<div class="form-group last">
									<div class="col-sm-offset-3 col-sm-9">
										<button type="submit" class="btn btn-success btn-sm"
											name="action" value="submit">Submit Application</button>
									</div>
								</div>
							</form:form>




						</c:otherwise>
					</c:choose>




				</div>
				<div class="panel-footer"></div>
			</div>
		</div>
	</div>

</body>
</html>