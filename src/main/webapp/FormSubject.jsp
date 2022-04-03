<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="favicon.ico" />
</head>
<title>Add Subject</title>
<script type="text/javascript">
	function validate() {
		if (document.SubjectForm.subject_Code.value == null
				|| document.SubjectForm.subject_Code.value == "") {
			alert("Please key-in subject code");
			return false;
		}
		if (document.SubjectForm.subject_Name.value == null
				|| document.SubjectForm.subject_Name.value == "") {
			alert("Please key-in subject name");
			return false;
		}
		return true;
	}
</script>
<body>
	<div class="container">
		<h2>Subject & Lecturer Details</h2>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form name="SubjectForm" action="AssignmentController"
					onSubmit="return validate()" method="POST">

					<div class="form-group">
						Subject Code: <input type="text" class="form-control"
							name="subCode" placeholder="Enter subject code" value="" />
					</div>
					<div class="form-group">
						Subject Name: <input type="text" class="form-control"
							name="subjectName" placeholder="Enter subject name" value="" />
					</div>

					<input type="reset" class="btn btn-success" name="reset"
						value="Reset" />
					<button style="margin: 10px, 10px;" type="submit"
						class="btn btn-success" name="action"
						value="ADDNEWSUBJECT">Add Subject</button>
				</form>

				<h1>Choose Subject</h1>
				<table class="table table-striped table-bordered">
					<tr class="thead-dark">
						<th>Subject Code</th>
						<th>Subject Name</th>
						<th></th>
					</tr>

					<c:forEach items="${Subject}" var="sub" varStatus="count">

						<tr>

							<td>${sub.subjectCode}</td>
							<td>${sub.subjectName}</td>

							<td><form action="AssignmentController" method="POST">
									<button class="btn btn-secondary"
										onclick="return confirm('Are you sure you want to choose this subject?');"
										name="action" value="ADDLECT">Choose</button>
									<input type="hidden" name="subCode"
										value="${sub.subjectCode}" />
								</form></td>
						</tr>

					</c:forEach>
				</table>

				<button type="submit" class="btn btn-success" name="action"
					value="BACK" form="back">Back</button>
				<form id="back" action="AssignmentController" method="POST"></form>
			</div>
		</div>
	</div>
</body>
</html>
