<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	padding: 0;
	margin: 0;
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
	width: 500px;
	height: 520px;
	box-shadow: 4px 4px 4px #014670;
}

.login {
	order: 1;
	width: 500px;
	background-color: #eaeaea;
	text-align: center;
}

.header h1 {
	margin-top: 50px;
	margin-bottom: 30px;
	color: #014670;
	font-size: 25px;
}

.main input, button {
	width: 80%;
	height: 35px;
	margin-top: 25px;
	padding-left: 8px;
	box-sizing: border-box;
	outline: none;
	border: 1px solid #014670;
	color: #014670;
}

.main button {
	border-radius: 20px;
	border: 1px solid #8FBC8F;
	background-color: #8FBC8F;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

.main button:hover, input:hover {
	box-shadow: 3px 3px 3px rgba(1, 70, 112, .5);
}

.main a {
	display: block;
	font-size: 13px;
	text-align: right;
	margin: 10px 32px;
	color: #014670;
}

.input-box {
	margin-bottom: 15px;
	width: 100%;
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
</style>
</head>
<body>
<div class="container">
		<div class="login">
			<div class="header">
				<h1>Registration</h1>
			</div>
			<div class="main">
				<p>${NOTIFICATION}</p>

				<form action="LoginRegisterController" method="POST"
					name="registerform">
					<div class="input-box">
						<label for="username">Username</label><br> <input type="text"
							name="usrname" required
							title="Input username. No spaces or special character"
							pattern="[a-zA-Z0-9]+" />
					</div>
					<div class="input-box">
						<label for="password">Password</label><br> <input
							type="password" name="password" required
							title="Input password more than 3 characters" pattern=".{3,}" /><br />
					</div>
					<div class="input-box">
						<label for="name">Name</label><br> <input type="text"
							name="name" required title="Input name. No numbers"
							pattern="[a-zA-Z ]*" /><br />
					</div>
					<button type="submit" name="action" value="REGISTERUSER">Register</button>
				</form>
			</div>
		</div>
		</div>
</body>
</html>