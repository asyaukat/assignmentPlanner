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

<style>
<style>

body {
background-color : #FAFAD2   ;
}
/* Style the tab */
.tab {
	overflow: hidden;
	border: none;
}
td{font-family:Bradley Hand, cursive}
/* Style the buttons that are used to open the tab content */
.tab button {
	background-color: #C69B4F ;
	float: left;
	border: none ;
	outline: none;
	cursor: pointer;
	padding: 10px 16px;
	transition: 0.3s;
	border: 3px outset #E5C080 ;
	
}

.tablinks1{
border-top-right-radius: 25px;
}
.tablinks2{
border-top-right-radius: 25px;
}
/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #E5C080  ;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #F0CB8C ;
	transform: translate(0px, 5px);
    -webkit-transform: translate(0px, 5px);
    box-shadow: 0px 1px 0px 0px;
}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {background-color: #f0f0f0;}
tr:nth-child(odd) {background-color: white;}
/* Style the tab content */
.tabcontent {
    background-color: #F0DAB4;
    border-bottom-left-radius: 12px;
    border-bottom-right-radius: 12px;
    border-top-right-radius: 12px;
	display: none;
	padding: 6px 12px;
	border: 3px outset #E5C080 ;
	overflow: auto;
}


/* CSS */
.button-62 {
  align-items: center;
  appearance: none;
  background-image: radial-gradient(100% 100% at 100% 0, #EF4765 0, #FF9A5A 100%);
  border: 0;
  border-radius: 6px;
  box-shadow: rgba(45, 35, 66, .4) 0 2px 4px,rgba(45, 35, 66, .3) 0 7px 13px -3px,rgba(58, 65, 111, .5) 0 -3px 0 inset;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-flex;
  font-family: "JetBrains Mono",monospace;
  height: 48px;
  justify-content: center;
  line-height: 1;
  list-style: none;
  overflow: hidden;
  padding-left: 16px;
  padding-right: 16px;
  position: relative;
  text-align: left;
  text-decoration: none;
  transition: box-shadow .15s,transform .15s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  white-space: nowrap;
  will-change: box-shadow,transform;
  font-size: 18px;
}

.button-62:focus {
  box-shadow: #FC6A6A  0 0 0 1.5px inset, rgba(45, 35, 66, .4) 0 2px 4px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #FC6A6A   0 -3px 0 inset;
}

.button-62:hover {
  box-shadow: rgba(45, 35, 66, .4) 0 4px 8px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #FC6A6A   0 -3px 0 inset;
  transform: translateY(-2px);
}

.button-62:active {
  box-shadow: #FC6A6A   0 3px 7px inset;
  transform: translateY(2px);
}

h1 {  
color: #0C0C0C ; font-size: 50px; margin-top: 20px;
padding-bottom : 16px; text-align: left; text-shadow: 0 1px 1px #fff;}
</style>

</style>

</head>
<title>Add Assignment</title>
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
				<h1>Choose Subject and Lecturer or Add new Subject and Lecturer</h1>
				<table class="table table-striped table-bordered">
					<tr class="thead-dark">
						<th>Subject Code</th>
						<th>Subject Name</th>
						<th>Lecturer Name</th>
						<th>Lecturer Phone Number</th>
						<th></th>
					</tr>

					<c:forEach items="${LectSub}" var="lectsub" varStatus="count">

						<tr>

							<td>${lectsub.subjectCode}</td>
							<td>${lectsub.subjectName}</td>
							<td>${lectsub.lecturerName}</td>
							<td>${lectsub.lecturerPhoneNum}</td>

							<td><form action="AssignmentController" method="POST">
									<button class="btn btn-secondary"
										onclick="return confirm('Are you sure you want to choose this subject?');"
										name="action" value="CHOOSESUBLECT">Choose</button>
									<input type="hidden" name="subCode"
										value="${lectsub.subjectCode}" /> <input type="hidden"
										name="lecturerName" value="${lectsub.lecturerName}" />
								</form></td>
						</tr>

					</c:forEach>
				</table>

				<button type="submit" class="btn btn-success" name="action"
					value="BACK" form="back">Back</button><button type="submit" class="btn btn-success" name="action"
					value="ADDSUB" form="back">Add Subject & Lecturer</button>
				<form id="back" action="AssignmentController" method="POST"></form>

</body>
</html>
