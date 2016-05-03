<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Application</title>
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
						<form:form class="form-horizontal" role="form"
							modelAttribute="user">
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
					<form:form class="form-horizontal" modelAttribute="applicant">

						<div class="form-group">
							<label class="col-sm-3 control-label">First Name<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="fname"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Last Name<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="lname"
									required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Email<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="email"
									required="required" />
							</div>
						</div>



						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9"></div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Term<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:select path="term" class="form-control">
									<form:option value="NONE" label="--- Select ---" />
									<form:option value="Fall2016" item="Fall2016" />
									<form:option value="Winter2017" item="Winter2017" />
									<form:option value="Spring2017" item="Spring2017" />
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Department<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<div class="col-sm-9">
									<form:hidden path="dept.dept_id" />
									<form:input class="form-control" path="dept.dept_name"
										required="required" />
								</div>
							</div>
						</div>


						<%-- 						 <div class="form-group"> 
							<label class="col-sm-3 control-label">Program</label>
							<div class="col-sm-9">
								<select name="program1" class="form-control" id="program1" >
									<option value="0" label="--- Select ---" />
								</select>
							</div>
						</div> --%>

						<div class="form-group">
							<label class="col-sm-3 control-label">Program<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:select path="program.prg_id" class="form-control"
									id="program1">

									<form:options items="${dept.programs}" itemValue="prg_id"
										itemLabel="prg_name" />
								</form:select>
							</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label">CIN<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="CIN" required="required" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">Phone No.<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="phone"
									required="required" />
							</div>
						</div>



						<div class="row">
							<label class="col-sm-3 control-label">Gender<span style="color: red;">*</span></label>
							<div class="col-sm-9">

								<form:radiobutton class="radio-inline control-label"
									path="gender" value="true" label="Male" />
								&nbsp
								<form:radiobutton class="radio-inline control-label"
									path="gender" value="false" label="Female" />

							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Date of Birth(Enter Date in MM/dd/yyyy)<span style="color: red;">*</span></label>
							<div class="col-sm-9">

								<input class="form-control" name="dob"
									value="<fmt:formatDate  value="${applicant.dob }"  pattern="M/d/yyyy" />"
									required="required" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">Citizenship<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:select path="citizenship" class="form-control">
									<form:option value="NONE" label="--- Select ---" />
									<form:option value="USA" item="USA" />
									<form:option value="India" item="India" />
									<form:option value="South Africa" item="South Africa" />
									<form:option value="Spain" item="Spain" />
									<form:option value="Sri Lanka" item="Sri Lanka" />
									<form:option value="Canada" item="Canada" />
									<form:option value="Brazil" item="Brazil" />
									<form:option value="China" item="China" />
									<form:option value="Columbia" item="Columbia" />
									<form:option value= "Germany" item="Germany" />
									<form:option value= "Egypt" item="Egypt" />
									<form:option value= "Greece" item="Greece" />
									<form:option value= "Korea, Republic of"  item="Korea, Republic of" />
									
								</form:select>
							</div>
						</div>
							
							<div class="form-group">
							<label class="col-sm-3 control-label">Toefl<span style="color: red;">*</span></label>
							<div class="col-sm-9">
								<form:input class="form-control" path="toefl" required="required" />
							</div>
						</div>



						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm"
									name="action" value="save1">Save</button>
								<button type="submit" class="btn btn-success btn-sm"
									name="action" value="save2">Save & Continue</button>

							</div>
						</div>

						<input type="hidden" value="${useredit.user_id}" name="user_id">
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