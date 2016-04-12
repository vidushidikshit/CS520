<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<form action="DisplayApplication" method="post">
		<fieldset>
		<legend></legend>
			<p style="font: bold; font-size: medium;">CS Grad Admission</p>
			<a href="AddNewApplication">Add New Application</a>

			<table class="table table-bordered">
			<caption class="bg-info" style="font: bold; font-size: small;">   Application List</caption>
				<thead>
					<tr>
						<th>Sr.No</th>
						<th><a href="DisplayApplication?param=name" >Applicant</a></th>
						<th><a href="DisplayApplication?param=date">Application Received On</a></th>
						<th><a href="DisplayApplication?param=gpa">GPA</a></th>
						<th><a href="DisplayApplication?param=status">Status</a></th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${applicant}" var="applicant">
						<tr>
							<td>${applicant.id}</td>
							<td>${applicant.name }</td>
							<td><fmt:formatDate pattern="M/d/yyyy"
									value="${applicant.recieved}" /></td>
							<td><c:if test="${applicant.gpa!=0.0}">
							${applicant.gpa}
							</c:if>
							</td>
							<td>${applicant.status }</td>
							<td><a href="EditApplication?id=${applicant.id }">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



		</fieldset>



	</form>
</body>
</html>