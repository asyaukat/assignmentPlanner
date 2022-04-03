<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
<link rel="icon" type="image/x-icon" href="favicon.ico" />

<style>
{
padding


:


0


;
margin


:


0


;
}
html, body {
	width: 100%;
	height: 100%;
	display: flex;
	background-image: url(resource/assignplanner.jfif);
	background-size: cover;
	background-position: center;
	font-family: sans-serif;
}

.container {
	display: flex;
	margin: auto;
	width: 600px;
	height: 600px;
	border-radius: 25px;
	box-shadow: 4px 4px 4px #014670;
	background-color: #FAFAD2;
	margin-top: 10px;
	alignment: center;
}

.header h1 {
	margin-top: 15px;
	margin-bottom: 15px;
	color: #014670;
	font-size: 20px;
	text-align: center;
	display: block
}

.main input, button {
	width: 80%;
	height: 35px;
	margin-top: 5px;
	padding-left: 8px;
	box-sizing: border-box;
	outline: none;
	border: 1px solid #014670;
	color: #014670;
	padding-left: 200px;
}

.main button {
	width: 130px;
	height: 30px;
	border-radius: 20px;
	border: 1px solid #D2B48C;
	background-color: #D2B48C;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 5px 5px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
	border-radius: 20px;
}

.main button:hover, input:hover {
	box-shadow: 3px 3px 3px rgba(1, 70, 112, .5);
}

.main a {
	display: block;
	font-size: 13px;
	text-align: center;
	margin: 10px 32px;
	color: #014670;
}

.input-box {
	margin-bottom: 15px;
	width: 100%;
	padding-left: 50px;
}

.input-box input {
	height: 35px;
	outline: black;
	font-size: 16px;
	border-radius: 5px;
	padding-left: 15px;
	border: 1px solid #ccc;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
	box-sizing: border-box;
	outline: none;
	border: 1px solid #014670;
}

.user-details .input-box input:focus, .user-details .input-box input:valid
	{
	border-color: #9b59b6;
}

.textarea {
	resize: none;
	margin-bottom: 15px;
	width: 100%;
	padding-left: 50px;
}

.textarea input {
	outline: black;
	font-size: 16px;
	border-radius: 5px;
	padding-left: 15px;
	border: 1px solid #ccc;
	border-bottom-width: 2px;
	transition: all 0.3s ease;
	box-sizing: border-box;
	outline: none;
	border: 1px solid #014670;
}

.select-box {
	margin-bottom: 15px;
	width: 100%;
	padding-left: 50px;
}
</style>

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

		if (document.AssignmentForm.status.selectedIndex == 0) {
			alert("Please select status of assignment");
			return false;
		}
		return true;

	}
</script>
<body>
	<div class="container">
		<div class="login" style="margin: auto">
			<div class="header">
				<h1>Assignment Details</h1>
			</div>
			<div class="main">
				<p style="color: #b50e0e">${NOTIFICATION}</p>
				<hr>
				<div class="row">
					<div class="col-md-4">
						<form name="AssignmentForm" action="AssignmentController"
							onSubmit="return validate()" method="POST">
							<div class="input-box">
								<label for="subject_Name">Subject:</label><br>${LectSub.subjectCode}${subjectCode}<input type="hidden" name="subjectCode" value="${LectSub.subjectCode}${subjectCode}"/>
							</div>
							<div class="input-box">
								<label for="title">Assignment Name:</label><br> <input
									type="text" class="form-control" name="title"
									placeholder="Enter assignment name" value="${assignment.title}" />
							</div>
							<div class="textarea">
								<label for="comments">Assignment Description:</label><br>
								<textarea rows="5" cols="50" name="comments"
									placeholder="Enter assignment description" maxlength="100"
									value="${assignment.comments}"></textarea>
							</div>
							<div class="input-box">
								<label for="lect_name">Lecturer Name:</label><br>${LectSub.lecturerName}${lecturerName}<input type="hidden" name="lecturerName" value="${LectSub.lecturerName}${lecturerName}"/>
							</div>
							<div class="select-box">
								<label for="status">Status:</label><br> <select
									name="status" required>
									<option value=""></option>
									<option value="unbegun">Unbegun</option>
									<option value="inprogress">In Progress</option>
									<option value="onhold">On Hold</option>
									<option value="completed">Completed</option>
								</select>
							</div>
							<div class="input-box">
								<label for="due">Due Date:</label><br> <input type="date"
									class="form-control" name="due" required
									value="${assignment.due}" />
							</div>
							<div style="margin: auto; text-align: center">
								<button type="reset" class="button" name="reset" value="Reset">Reset</button>
								<button type="submit" class="button" name="action"
									value="SUBMITASSIGNMENT">Submit</button>
								<button type="submit" class="button" name="action" value="BACK"
									form="back">Back</button>
							</div>
						</form>
						<form id="back" action="AssignmentController" method="POST"></form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>