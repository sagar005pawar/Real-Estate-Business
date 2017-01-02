<%@page import="model.Vehicle"%>
<%@page import="model.User"%>
<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Unauthorized Vehicles</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
		ArrayList<Vehicle> vehicleArrayList = new ArrayList<Vehicle>();
		vehicleArrayList = (ArrayList<Vehicle>) httpSession.getAttribute("vehicleArrayList");
		Vehicle[] vehicle = new Vehicle[vehicleArrayList.size()];
		
		for (int i = 0; i < vehicleArrayList.size(); i++) {
			vehicle[i] = new Vehicle();
			vehicle[i] = vehicleArrayList.get(i);
		}
		try {
			user.getName();

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
				<li class="active"><a href="BargainCntr?page=Vehicles">Home</a></li>
				<li><a href="BargainCntr?page=Vehicles">Properties</a></li>
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
				
				<form action="BargainCntr?page=VehicleAssetsFilteration" method="post">
				<ul class="nav nav-pills nav-stacked">
				    <div class="form-group">
      					<label  for="propertytype">Vehicle Status: </label>
      					<div class="chechbox col-sm-offset-2">
	      					<li><label><input type="checkbox" name="a" value="a"> A </label> </li>
    	  					<li><label><input type="checkbox" name="b" value="b"> B </label></li>
     	 					<li><label><input type="checkbox" name="c" value="c"> C </label></li>
      					</div>
    				</div>
				<hr>
				    <div class="form-group">
      					<label  for="usagetype">Vehicle Condition: </label>
      					<div class="chechbox col-sm-offset-2">
	      					<li><label><input type="checkbox" name="d" value="a"> A </label> </li>
    	  					<li><label><input type="checkbox" name="e" value="b"> B </label></li>
     	 					<li><label><input type="checkbox" name="f" value="c"> C </label> </li>
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
				<p class="lead text-primary" align="center">Un-Authorized Vehicles
					List</p>
				<hr>
				
				<div class="row">
					<div class="col-lg-12 col-md-8">
					<form action="BargainCntr?page=UnAuthorizedVehicleListRefresh" method="post">	
						<div class="table-responsive">
							
							<%
								vehicle[0].getVehicleName();
							%>
						
							<table class="table table-striped">
								
									
								<thead class="thead-success" style="background-color: lightgray">
									<tr>
										<th>Id</th>
										<th>Asset Name</th>
										<th>Category</th>
										<th>E-Price</th>
										<th>Seller Name</th>
										<th>#</th>
									</tr>
								</thead>
								<%
									for (int i = 0; i < vehicleArrayList.size(); i++) {
									%>
								<tbody>																	
									<tr>
										<td><%=vehicle[i].getId()%></td>
										<td><%=vehicle[i].getVehicleName()%></td>
										<td><%=vehicle[i].getCategory()%></td>
										<td><%=vehicle[i].getEprice()%></td>
										<td><%=vehicle[i].getSname()%></td>
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
								<h3 align="center">There is no unauthorized VEHICLES available here...</h3>							
							<%
								} catch (NullPointerException e) {
									// TODO: handle exception
									System.out.println("Unknown User");
									response.sendRedirect("BargainCntr?page=Logout");
								}
	%>
</body>
</html>