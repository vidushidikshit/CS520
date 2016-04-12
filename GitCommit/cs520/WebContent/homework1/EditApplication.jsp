<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Application</title>
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
<form action="EditApplication" method="post">
		<fieldset>
			<p style="font: bold; font-size: medium;">
				<a href="DisplayApplication">CS Grad Admission</a>> Edit
				Application
			</p>

			<table class="table table-bordered">
				<thead>
					<c:forEach items="${applicant }" var="applicant" >
					<c:if test="${applicant.id ==  id}">
					<tr>
						<td><label>Applicant:</label></td>
						<td><input type="text" name="name" value="${applicant.name }" class="form-control" required></td>
					</tr>
					<tr>
						<td><label>Application Received On (M/d/yyyy):</label></td>
						<td><input type="text" name="date" value="<fmt:formatDate pattern="M/d/yyyy"
									value="${applicant.recieved}" />"/ class="form-control" required></td>
					</tr>
					<tr>
						<td><label>GPA:</label></td>
						<c:choose>
						<c:when test="${applicant.gpa!=0.0}">
						
						<td><input type="text" name="gpa" value="${applicant.gpa}" class="form-control" ></td>
						
						
					</c:when>
					<c:otherwise>
					<td><input type="text" name="gpa"  class="form-control" ></td>
					</c:otherwise>
					</c:choose>
					</tr>
					
					<tr>
						<td><label>Status:</label></td>
						<td><select name="status" class="form-control">
								<option value="Application Incomplete" 
								<c:if test="${applicant.status == 'Application Incomplete'}">selected="selected"</c:if>>Application Incomplete</option>
								<option value="Pending Review" 
								<c:if test="${applicant.status == 'Pending Review'}">selected="selected"</c:if>>Pending Review</option>
								<option value="Rejected" 
								<c:if test="${applicant.status == 'Rejected'}">selected="selected"</c:if>>Rejected</option>
								<option value="Accepted" 
								<c:if test="${applicant.status == 'Accepted'}">selected="selected"</c:if>>Accepted</option>
								<option value="Admission Offer Sent" 
								<c:if test="${applicant.status == 'Admission Offer Sent'}">selected="selected"</c:if>>Admission Offer Sent</option>
								<option value="Admission Offer Accepted" 
								<c:if test="${applicant.status == 'Admission Offer Accepted'}">selected="selected"</c:if>>Admission Offer Accepted</option>
						</select></td>
					</tr>
					<tr>
					<td><input type="hidden" name="id" value="${applicant.id}"></td>
					<td><input type="submit" name="Save" value="Save" class="btn btn-primary"></td>
					</tr>
					</c:if>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
	</form>

</body>
</html>