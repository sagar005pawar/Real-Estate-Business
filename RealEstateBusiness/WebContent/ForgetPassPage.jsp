<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget Password</title>
</head>
<body onload="window.forgetForm.name.focus()">
	<form action="UserController?page=ForgetPassPage"  method="post" name="forgetForm">
		<!-- Enter UserName: <input type="text" name="uname"><br/> -->
		Enter email: <input type="text" name="email" id="email"><br/>
		<!-- Enter City: <input type="text" name="cty"> -->
		<br>
		<input type="submit" value="Submit"> 
	</form>
</body>
</html>