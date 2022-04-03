<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Assignment List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="icon" type="image/x-icon" href="favicon.ico" />



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
font-family: 'Brush Script MT', cursive ; color: #0C0C0C ; font-size: 60px; margin-top: 20px;
padding-bottom : 16px; text-align: left; text-shadow: 0 1px 1px #fff;}
</style>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>
	function openCity(evt, listName) {
		// Declare all variables
		var i, tabcontent, tablinks;

		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(listName).style.display = "block";
		evt.currentTarget.className += " active";
	}

	function defTab() {
		document.getElementById("defaultTab").click();
	}
</script>

</head>
<body onload ="defTab()">

	<div class="container">
		<form action="AssignmentController" method="POST" id="buttonForm">
		
			<h1>My Assignments</h1>
			<button class="button-62" name="action" value="ADDASSIGNMENT">Add Assignment</button>
		</form>
		<p style="color: #b50e0e">${NOTIFICATION}</p>
		<hr style = "height:2px; border-width:0; color:gray;background-color:gray"><br>


		<!-- Tab links -->
		<div class="tab">
			<button style="color: #fff" class="tablinks1" onclick="openCity(event, 'AssignmentList')" id="defaultTab">Assignment
				List</button>
			<button style="color: #fff" class="tablinks2" onclick="openCity(event, 'LectSubList')">Subject
				& Lecturer</button>
		</div>

		<div id="LectSubList" class="tabcontent">
			<table class="table">
				<tr style="background-color: #C69B4F ; color : white;">
					<th>Subject Code</th>
					<th>Subject Name</th>
					<th>Lecturer Name</th>
					<th>Lecturer Phone Number</th>
					<!-- <th colspan = "1"></th> -->
				</tr>

				<c:forEach items="${Lect_Sub}" var="lectsub" varStatus="count">

					<tr>

						<td>${lectsub.subjectCode}</td>
						<td>${lectsub.subjectName}</td>
						<td>${lectsub.lecturerName}</td>
						<td>${lectsub.lecturerPhoneNum}</td>
						
                        <!-- <td>
						 <form action="AssignmentController" method="POST">
							<button class="btn btn-outline-danger"
								onclick="return confirm('Are you sure you want to delete this item?');"
								name="action" value="DELETE_LECTSUB">
								<i class="bi bi-trash"></i>
							</button> <input type="hidden" name="subjectCode" value="" /> <input
							type="hidden" name="subCode" value="${lectsub.subjectCode}" /> <input
							type="hidden" name="lecturerName" value="${lectsub.lecturerName}" /><input
							type="hidden" name="lecturerPhoneNum"
							value="${lectsub.lecturerPhoneNum}" /></form></td>-->
					</tr>

				</c:forEach>
			</table>
		</div>

		<div id="AssignmentList" class="tabcontent">
			<table class="table">
				<tr style="background-color: #956640; color : white;">
					<th>Subject</th>
					<th>Assignment Name</th>
					<th>Assignment Description</th>
					<th>Lecturer Name</th>
					<th>Status</th>
					<th>Due Date</th>
					<th colspan = "2"></th>
				</tr>

				<c:forEach items="${assignment}" var="assignment" varStatus="count">

					<tr>

						<td>${assignment.subject_Name}</td>
						<td>${assignment.title}</td>
						<td>${assignment.comments}</td>
						<td>${assignment.lect_Name}</td>
						<td>${assignment.status}</td>
						<td>${assignment.due}</td>
						<td>
							<form action="AssignmentController" method="POST">
								<button class="btn btn-outline-secondary" name="action"
									value="UPDATEVIEW">
									<i class="bi bi-pencil"></i>
								</button>
								<input type="hidden" name="singleassignmentName"
									value="${assignment.subID}" /> <input type="hidden" name="lecturerName"
									value="${assignment.lect_Name}" /><input type="hidden"
									name="singleassignmentTitle" value="${assignment.title}" />
							</form>
						</td>

						<td><form action="AssignmentController" method="POST">
								<button class="btn btn-outline-danger"
									onclick="return confirm('Are you sure you want to delete this item?');"
									name="action" value="DELETE">
									<i class="bi bi-trash"></i>
								</button>
								<input type="hidden" name="subID"
									value="${assignment.subID}" /><input type="hidden"
									name="title" value="${assignment.title}" />
							</form></td>
						
					</tr>

				</c:forEach>
			</table>
		</div>
		<button style="background-color: #D2B48C ; border: 1px solid #49270B ; margin-top: 16px; color: black;" type="submit" class="btn btn-success" name="action"
			value="LOGOUT" form="buttonForm">Log Out</button>
	</div>

</body>
</html>
