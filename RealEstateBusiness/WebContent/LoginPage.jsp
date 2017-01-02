<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Login Page</title>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script type="text/javascript" src="javascript/jquery.min.js"></script>
  <script type="text/javascript" src="javascript/loginValidation.js"></script>  
  <script src="js/bootstrap.min.js"></script>
  <script src="js/index.js"></script>
  <link rel="stylesheet" href="css/style.css">
  
   <style type="text/css" src="css/style.css">
      /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
      height: 30px;
    }

    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 1;
      margin-top: 0;
      padding-left:4;
      position: relative;
      background: #000 url("images/2.jpg") center center;
      /* width: 100%;
      height: 100%;
      background-size: cover; */
      background-size: 50% 100%;
   	  color: rgb(196, 247, 56); 			/* change text color */
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
  $(document).ready(function () {
               $("#myAccount").jqxMenu("disable", "home", true);
     
  });  	
  </script>
  
 <!--  <script type="text/javascript">
	function validation() {
		var name=document.loginForm.usname.value;
		var password=document.loginForm.pass.value;
		document.getElementById("errorMessage").innerHTML="Login Field should not be blank..";
		if(name==""){
			document.getElementById("errorMessage").innerHTML="Login Field should not be blank..";
			//window.alert("Login Field should not be blank..");
			document.loginForm.usname.focus();
			return false;
		}
		if(password==""){
			window.alert("Password Field should not be blank..");
			document.loginForm.pass.focus();
			return false;
		}
		return true;
	}
</script> -->

</head>
<%
	HttpSession sess = request.getSession();
	if(sess.isNew()) {
		response.sendRedirect("LoginPage.jsp");
	} else {
%>

<body >
		
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><!-- <img src="images/best-Real-Estate-Logo-For-Blogger.jpg" class="img-thumbnail" alt="Cinque Terre" width="90" height="20" align="middle"/> --></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="BargainCntr?page=BuyerLink">Home</a></li>        
        <li><a href="BargainCntr?page=BuyerLink">Properties</a></li>
        <li><a href="ContactUs.jsp">Contact Us</a></li>
        <li><a href="AboutUs.jsp">About</a></li>
      </ul>
    </div>
  </div>
</nav>


<div class="container">
<h1 align="center">Real-Estate Business</h1>
<hr>
	<section id="content">
		<form method='post' name="loginForm" onsubmit='return(validation())'>
			<h1>Login</h1>
			<div>
				<input type="text" class="user" placeholder="Username" name="usname" required="required" id="usname" />
			</div>
			<div>
				<input type="password" class="password" placeholder="Password" name="pass" required="required" id="pass" />
			</div>
			<div>
				<input type="button" class="btn-warning  btn-lg" id="login" name="login" value="Log in" />
				<a href="ForgetPassPage.jsp">Forget your password?</a>
				<a href="Register.jsp">Register</a>
			</div>
			<div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <span class="text-danger" id="errorMessage"></span>
                            </div>
            </div>
		</form><!-- form -->
		<div class="button">
			<a href="#">Real-Estate Business</a>
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->

  
<hr>
<%} %>
</body>
</html>