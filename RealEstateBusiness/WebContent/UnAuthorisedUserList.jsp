<%@page import="model.User"%>
<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unauthorized Users</title>
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

<style>
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

.navbar-custom {
	background-color: #004D99;
	color: "#0174DF";
}
/* Remove the jumbotron's default bottom margin */

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
</head>
<body>
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		ArrayList<User> a1 = new ArrayList<User>();
		a1 = (ArrayList<User>) httpSession.getAttribute("a");
		User[] u = new User[a1.size()];
		for (int i = 0; i < a1.size(); i++) {
			u[i] = new User();
			u[i] = a1.get(i);
		}
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

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav hidden-xs">
			<div class="col-sm-offset-3">
				<img alt="LOGO" src="images/logo.jpg" height="90px" width="100px" align="middle">
			</div>
				<form action="BargainCntr?page=AssetsFilteration" method="post">
				<ul class="nav nav-pills nav-stacked">
				    <div class="form-group">
      					<label  for="propertytype">Property Type: </label>
      					<div class="chechbox col-sm-offset-2">
	      					<li><label><input type="checkbox" name="singleflat" value="Single Flat"> Single Flat </label> </li>
    	  					<li><label><input type="checkbox" name="townhouse" value="Town House"> Town House </label></li>
     	 					<li><label><input type="checkbox" name="condo" value="Condo"> Condo </label></li>
      					</div>
    				</div>
				<hr>
				    <div class="form-group">
      					<label  for="usagetype">Usage Type: </label>
      					<div class="chechbox col-sm-offset-2">
	      					<li><label><input type="checkbox" name="primary" value="Primary"> Primary </label> </li>
    	  					<li><label><input type="checkbox" name="rental" value="Rental"> Rental </label></li>
     	 					<li><label><input type="checkbox" name="secondary"  value="Secondary"> Secondary </label> </li>
      					</div>
    				</div>
    				
    				<div class="row">
						<div class="col-sm-6" align="right"
							style=" font-size: 16; margin-left: 64px; ">
							<button type="submit" class="btn btn-info"><b>Search</b></button>
						</div>
					</div>		
				</ul>
				</form>
			</div>

			<div class="col-md-9 col-lg-10 main">

				<!--toggle sidebar button-->

				<hr>
				<p class="lead text-primary" align="center">Un-Authorized Users
					List</p>

				<hr>
				
				<div class="row">
					<div class="col-lg-12 col-md-8">
					<form action="UserController?page=UnAuthorisedUserList" method="post">
					
						<div class="table-responsive">
							<table class="table table-striped">
								<%
										u[0].getName();
 								%>
								<thead class="thead-success" style="background-color: lightgray">								
									<tr>
										<th>No.</th>
										<th>Name</th>
										<th>Email</th>
										<th>City</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody>
									<%
											for (int i = 0; i < a1.size(); i++) {
									%>									
									<tr>
										<td><%=i + 1%></td>
										<td><%=u[i].getName()%></td>
										<td><%=u[i].getEmail()%></td>
										<td><%=u[i].getCity()%></td>
										<td><input type="submit" name="btn[<%=i%>]"
											value="Approve" align="middle"></td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>							
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

<%
								} catch (IndexOutOfBoundsException e) {
									// TODO: handle exception
									System.out.print("\nIn user db table not any one related id present like that, so : " + e);
							%>
							<h3 align="center">There is no unauthorized USERs available here...</h3>
							<br>
							<br>
							<%
								}
							%>
</body>
</html>
