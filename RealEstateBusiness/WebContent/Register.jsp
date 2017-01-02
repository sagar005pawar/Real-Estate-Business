<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Registration</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="images/best-Real-Estate-Logo-For-Blogger.jpg">
  <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />  
  <link rel="stylesheet" type='text/css' href="css/bootstrap.min.css">
  <script type="text/javascript" src="javascript/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="javascript/searchAssetsAutocomplete.js"></script>
<script type="text/javascript" src="javascript/jquery-ui.js"> </script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="js/bootstrap.min.js"></script>
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      height: 30px;
    }
    /* Remove the jumbotron's default bottom margin */ 
     .mainText {
       	  color: rgb(255, 149, 177); 
       	  font-family: Arial, Helvetica, sans-serif;
       	  font-style: italic;
      
    }
    
    .panel-default {
 opacity: 0.9;
 margin-top:30px;
}
.form-group.last {
 margin-bottom:0px;
}

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
  
  <script type="text/javascript">
		function validation() {
			var name=document.registrationForm.usname.value;
			var email=document.registrationForm.emailId.value;
			var password=document.registrationForm.pass.value;
			var confirmPass=document.registrationForm.pass1.value;
			var city=document.registrationForm.city.value;
			if(name==""){
				document.getElementById("errorMessage").innerHTML="Name Field should not be blank..";
				document.registrationForm.usname.focus();
				return false;
			}
			if(email==""){
				document.getElementById("errorMessage").innerHTML="Email Field should not be blank..";
				//window.alert("Email Field should not be blank..");
				document.registrationForm.emailId.focus();
				return false;
			}
			if(password==""){
				document.getElementById("errorMessage").innerHTML="Password Field should not be blank..";
				//window.alert("Password Field should not be blank..");
				document.registrationForm.pass.focus();
				return false;
			}
			if(password!=confirmPass){
				document.getElementById("errorMessage").innerHTML="Password and Confirm Password doed not match";
				//window.alert("Password and Confirm Password doed not match");
				document.registrationForm.pass1.focus();
				return false;
			}
			if(city==""){
				document.getElementById("errorMessage").innerHTML="City Field should not be blank..";
				//window.alert("City Field should not be blank..");
				document.registrationForm.pass.focus();
				return false;
			}
			emailValidation();
			return true;
		}
		function emailValidation() {
		    var x = document.registrationForm.emailId.value;
		    var atpos = x.indexOf("@");
		    var dotpos = x.lastIndexOf(".");
		    if ((atpos<1) || (dotpos<atpos+2) || (dotpos+2>=x.length)) {
		    	document.getElementById("errorMessage").innerHTML="Not a valid e-mail address";
		        //alert("Not a valid e-mail address");
		        document.registrationForm.emailId.focus();
		        return false;
		    }
		}
	
	</script>

</head>
<body>
<%
	//HttpSession sess = request.getSession();
	//User user=(User)sess.getAttribute("user");	

%>	


<div class="container text-center mainText">
    <h1>Register</h1>      
	<p>be a Reviewer, Proprietor and Negotiator</p>
</div>

<div class="container col-sm-offset-4 col-sm-4">
  <!-- <h2 align="center">Registration form</h2> -->
  <form role="form" class="form-horizontal" action='UserController?page=Register' method='post' name="registrationForm"
		onsubmit="return(validation())">
  	<div class="form-group">
      <label for="usname">User name:</label>
      <input type="text" class="form-control" id="usname" name="usname" placeholder="Enter User name" class="form-control">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="emailId" name="emailId" placeholder="Enter email" class="form-control">
    </div>
    <div class="form-group">
      <label for="pass">Password:</label>
      <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter password" class="form-control">
    </div>
    <div class="form-group">
      <label for="pass1">Confirm Password:</label>
      <input type="password" class="form-control" id="pass1" name="pass1" placeholder="Confirm password" class="form-control">
    </div>
    <div class="form-group">
      <label for="pwd">Address:</label>
      <input type="text" class="form-control" id="city" name="city" placeholder="Enter City" class="form-control">
    </div>
    
    <div class="form-group">
      <label  for="reviewer">Want to be: </label>
      <div class="chechbox col-sm-offset-2">
	      <label><input type="checkbox" name="reviewer"> Reviewer    </label>
    	  <label><input type="checkbox" name="negotiator"> Negotiator  </label>
    	  <label><input type="checkbox" name="proprietor"> Proprietor  </label>
      </div>
    </div>
    
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
              <strong><span class="text-danger" id="errorMessage"></span></strong>
        </div>
    </div>
    
    <div class="col-sm-offset-1">
    	<button type="button" class="btn btn-info col-sm-offset-1" onclick='window.location.href="LoginPage.jsp"'> Goto Login </button>
    	<button type="submit" class="btn btn-success col-sm-offset-1">Next</button>
    	<button type="reset" class="btn btn-danger col-sm-offset-1">Reset</button>
    </div>
  </form>
</div> 	


<!-- <footer class="container-fluid text-center">
  <p>@All rights reserved</p>
</footer> -->

</body>
</html>
