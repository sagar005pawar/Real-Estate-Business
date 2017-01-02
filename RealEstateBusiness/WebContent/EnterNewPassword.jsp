
<html>
<head>
<title>Register Page</title>
<script type="text/javascript">
		function validation() {
			var name=document.registrationForm.usname.value;
			var email=document.registrationForm.emailId.value;
			var password=document.registrationForm.pass.value;
			var confirmPass=document.registrationForm.pass1.value;
			var city=document.registrationForm.city.value;
			
			if(password==""){
				window.alert("Password Field should not be blank..");
				document.registrationForm.pass.focus();
				return false;
			}
			if(password!=confirmPass){
				window.alert("Password and Confirm Password doed not match");
				document.registrationForm.pass1.focus();
				return false;
			}
			
			return true;
		}		
	
	</script>
</head>
<body style="background-color: lightblue"
	onload='document.registrationForm.usname.focus()'>


	<form action='UserController?page=EnterNewPassword' method='post' name="registrationForm"
		onsubmit="return(validation())">
		<h1 align="center" style="color: blue">The Real Estate Business</h1>
		<table align="center">

			<tr>
				<td></td>
				<td style="color: red" align="center"><b>Enter New Password</b></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
			</tr>
			<tr>
			</tr>
			<tr>
				<td><b>Email :</b></td>
				<td align="center"><input type='text' name='email' value="<%=request.getParameter("id")%>" ></td>
			</tr>
			
			<tr>
				<td><b>Enter new Password:</b></td>
				<td><input type='password' name='pass'></td>
			</tr>
			<tr>
				<td><b>Confirm new Password:</b></td>
				<td><input type='password' name='pass1'></td>
			</tr>
			
			<tr></tr>
			<tr></tr>
			<tr>
				<td align="center"><input type="button" value="Cancel" onclick='window.location.href="LoginPage.jsp"'></td>
				<td align="center"><input type='submit' value='Submit'>
				<td align="center"><input type='reset' value='Reset'></td>

			</tr>




		</table>


		<!-- <a href='ForgetPassPage.jsp'>Forget Password </a> -->

	</form>

</body>

</html>