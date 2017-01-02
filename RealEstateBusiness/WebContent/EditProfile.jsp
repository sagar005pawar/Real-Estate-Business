<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Edit Profile</title>
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
		    if ((atpos < 1) || (dotpos<atpos+2) || (dotpos+2>=x.length)) {
		    	document.getElementById("errorMessage").innerHTML="Not a valid e-mail address";
		        //alert("Not a valid e-mail address");
		        document.registrationForm.emailId.focus();
		        return false;
		    }
		}
	
	</script>
  

</head>
<body style="background-image: url('images/9.jpg'); height: 100%; width: 100%;">
<%
	HttpSession httpSession=request.getSession();
	User u1 = (User) httpSession.getAttribute("user");
	User user = (User) httpSession.getAttribute("user");
	try {

%>

		
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <!-- <img src="images/best-Real-Estate-Logo-For-Blogger.jpg" class="img-thumbnail" alt="Cinque Terre" width="90" height="20" align="middle"/> -->
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="BargainCntr?page=BuyerLink">Home</a></li>
				<li><a href="BargainCntr?page=BuyerLink">Properties</a></li>
				<li><a href="ContactUs.jsp">Contact Us</a></li>
				<li><a href="AboutUs.jsp">About Us</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="BargainCntr?page=SelingAssetsList"><span
						class="glyphicon glyphicon-shopping-cart"></span> My Assets</a></li>
				<li class="dropdown" id="myAccount"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"><span
						class="glyphicon glyphicon-user"></span> Welcome! <%=user.getName() %> <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li>
							<a href="ViewMyProfile.jsp">
								<i class="glyphicon glyphicon-eye-open"></i> View Profile
							</a>
						</li>
						<li>
							<a href="EditProfile.jsp"> <i class="glyphicon glyphicon-edit"></i> Edit Profile </a>
						</li>
						
						<li class="divider"></li>
						<li><a href="UserController?page=Logout"><i
								class="glyphicon glyphicon-log-out"></i> Log Out </a></li>

					</ul></li>

				
		        <li><a href="UserController?page=Logout"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				<li class="dropdown" id="login"><a class="dropdown-toggle"
					data-toggle="dropdown"><span class="glyphicon glyphicon-log-in"></span>
						Fields<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="BargainCntr?page=BuyerLink">Properties</a></li>
					<li><a href="BargainCntr?page=SelingAssetsList">Seller Assets</a></li>
					<li><a href="BargainCntr?page=BiderAssetsList">Bider Assets</a></li>
					<%if(("authenticated").equals(user.getReviewer()) || ("admin").equals(user.getName())){ %>
						<li><a href="UserController?page=ReviewerUnUthorisedListRefresh">View Unauthorized users</a></li>
						<li><a href="BargainCntr?page=UnAAssetsLRefresh">View Unauthorized Assets</a></li>
						<li ><a href="BargainCntr?page=UnAuthorizedVehiclesList">View
							Unauthorized Vehicles</a></li>
					<%} 
					if(("authenticated").equals(user.getNegotiator()) || ("admin").equals(user.getName())){ %>
						<li><a href="BargainCntr?page=NegotiatorLP">Negotiation</a></li>
					<%} if(("author").equals(user.getName()) || ("admin").equals(user.getName())){ %>
						<li><a href="BargainCntr?page=AuthorizerApprvingBid-price">Authorization</a></li>
					<%} if(("admin").equals(user.getName())){ %>
						<li><a href="UserController?page=AdminHomePage">Approve roles</a></li>
					<%} %>
				</ul></li>
			</ul>
		</div>
	</div>
	</nav>


<div class="container text-center mainText">
    <h1>My Profile</h1>      
	<p>be a Reviewer, Proprietor and Negotiator</p>
</div>

<div class="container col-sm-offset-4 col-sm-4">
  <!-- <h2 align="center">Registration form</h2> -->
  	
  <form role="form" class="form-horizontal" action='UserController?page=EditProfile' method='post' name="registrationForm"
		onsubmit="return(validation())">
  	<div class="form-group">
      <label for="usname">User name:</label>
      <input type="text" class="form-control" id="usname" name="usname" value="<%=u1.getName() %>" class="form-control">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="emailId" name="emailId" value="<%=u1.getEmail() %>" class="form-control">
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
      <label for="city">Address:</label>
      <input type="text" class="form-control" id="city" name="city" value="<%=u1.getCity() %>" class="form-control">
    </div>
    <div class="form-group">
      <label for="ProfilePhoto">Profile photo:</label>
       <img src="<%=u1.getImage() %>" class="img-rounded" alt="Cinque Terre" width="304" height="236">
    </div>
    <div class="form-group">
      <label  for="reviewer">Want to be: </label>
      <div class="chechbox col-sm-offset-2">
      <label><input type="checkbox" name="reviewer" <% if(("authenticated").equals(u1.getReviewer())){%>disabled="disabled" checked="checked"<%} %>> Reviewer    </label>
      <label><input type="checkbox" name="negotiator" <% if(("authenticated").equals(u1.getNegotiator())){%>disabled="disabled" checked="checked"<%} %>> Negotiator  </label>
      <label><input type="checkbox" name="proprietor" <% if(("authenticated").equals(u1.getProprietor())){%>disabled="disabled" checked="checked"<%} %>> Proprietor  </label>
      </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
              <strong><span class="text-danger" id="errorMessage"></span></strong>
        </div>
    </div>
    
    <div class="col-sm-offset-1">
    	<button type="button" class="btn btn-info col-sm-offset-1" onclick='window.location.href="LoginPage.jsp"'> Goto Login </button>
    	<button type="submit" class="btn btn-success col-sm-offset-1">Update</button>
    	<button type="reset" class="btn btn-danger col-sm-offset-1">Reset</button>
    </div>
  </form>
</div> 	


<!-- <footer class="container-fluid text-center">
  <p>@All rights reserved</p>
</footer> -->
		<%
			} catch (NullPointerException e) {
				// TODO: handle exception
				System.out.println("Unknown User");
				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>

</body>
</html>
