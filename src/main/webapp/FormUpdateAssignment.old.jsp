<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="icon" type="image/x-icon" href="favicon.ico" />
</head>
<title>Add Assignment</title>
<script type="text/javascript">
	function validate() {
		if (document.AssignmentForm.subject_Name.value == null
				|| document.AssignmentForm.subject_Name.value == "") {
			alert("Please key-in subject name");
			return false;
		}
		if (document.AssignmentForm.title.value == null
				|| document.AssignmentForm.title.value == "") {
			alert("Please key-in the title of your assignment");
			return false;
		}
		if (document.AssignmentForm.lect_Name.value == null
				|| document.AssignmentForm.lect_Name.value == "") {
			alert("Please key-in lecturer name");
			return false;
		}

		if (document.Assignment.status.selectedIndex == 0) {
			alert("Please select status of assignment");
			return false;
		}
		return true;
	}
	
</script>
<body>
	<div class="container">
		<h2>Assignment Details</h2>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form name="AssignmentForm"
					action="AssignmentController"
					onSubmit="return validateForm()" method="POST">
					<div class="form-group">
						Subject: <input type="text" class="form-control"
							name="subject_Name" placeholder="Enter subject"
							value="${assignment.subject_Name}" />
					</div>
					<div class="form-group">
						Assignment Name: <input type="text" class="form-control"
							name="title" placeholder="Enter assignment name"
							value="${assignment.title}" />
					</div>
					<div class="form-group">
						Assignment Description:
						<textarea rows="5" cols="60" class="form-control" name="comments"
							placeholder="Enter assignment description"
							>${assignment.comments}</textarea>
					</div>
					<div class="form-group">
						Lecturer Name: <input type="text" class="form-control"
							name="lect_Name" placeholder="Enter lecturer name"
							value="${assignment.lect_Name}" />
					</div>
					<div class="form-group">
					
						Status: ${assignment.status} <br/>
						<select name="status" class="form-control">
							
							<option value="novalue"></option>
							<option value="unbegun">Unbegun</option>
							<option value="inprogress">In Progress</option>
							<option value="onhold" >On Hold</option>
							<option value="completed">Completed</option>
							
						</select>
					</div>
					<div class="form-group">
						Due Date: <input type="date" class="form-control" name="due"
							required value="${assignment.due}" />
					</div>
					<input type="reset" class="btn btn-success" name="reset"
						value="Reset" /> <button type="submit" class="btn btn-success"
						name="action" value="UPDATE">Update</button><button type="submit"
						class="btn btn-success"
						name="action" value="BACK">Back</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
