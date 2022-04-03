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
		<h2>Lecturer Details</h2>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form name="SubjectForm" action="AssignmentController"
					onSubmit="return validate()" method="POST">

					<div class="form-group">
						Lecturer Name: <input type="text" class="form-control"
							name="lecturerName" placeholder="Enter lecturer name" value="" />
					</div>
					<div class="form-group">
						Lecturer Phone Number: <input type="text" class="form-control"
							name="lecturerPhoneNum" placeholder="Enter lecturer phone number"
							value="" />
					</div>


					<input type="reset" class="btn btn-success" name="reset"
						value="Reset" />
					<button style="margin: 10px, 10px;" type="submit"
						class="btn btn-success" name="action"
						value="ADDNEWLECTURER">Add Lecturer</button>
				</form>

				<button type="submit" class="btn btn-success" name="action"
					value="BACK" form="back">Back</button>
				<form id="back" action="AssignmentController" method="POST"></form>
			</div>
		</div>
	</div>
</body>
</html>
