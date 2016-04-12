<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Application</title>
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
</head>
<body class="container">
<c:choose>
<c:when test="${errormessage!= null}">
<div class="alert alert-warning">
  <strong>Warning!</strong> ${errormessage}
</div>
</c:when>
</c:choose>
	<form action="AddNewApplication" method="post">
		<fieldset>
			<p style="font: bold; font-size: medium;">
				<a href="DisplayApplication">CS Grad Admission</a>> Add New
				Application
			</p>

			<table class="table table-bordered">
				<thead>
					<tr>
						<td><label>Applicant:</label></td>
						<td><input type="text" name="name" required class="form-control"></td>
					</tr>
					<tr>
						<td><label>Application Received On (M/d/yyyy):</label></td>
						<td><input type="text" name="date" required class="form-control"></td>
					</tr>
					<tr>
						<td><label>GPA:</label></td>
						<td><input type="text" name="gpa"  class="form-control"></td>
					</tr>
					<tr>
						<td><label>Status:</label></td>
						<td><select name="status" class="form-control">
								<option value="Application Incomplete">Application Incomplete</option>
								<option value="Pending Review">Pending Review</option>
								<option value="Rejected">Rejected</option>
								<option value="Accepted">Accepted</option>
								<option value="Admission Offer Sent">Admission Offer Sent</option>
								<option value="Admission Offer Accepted">Admission Offer Accepted</option>
						</select></td>
					</tr>
					<tr>
					<td></td>
					<td><input type="submit" name="Add" value="Add" class="btn btn-primary"></td>
					</tr>
				</thead>
			</table>
		</fieldset>
	</form>
</body>
</html>