<%@page import="model.User"%>
<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Assets</title>
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

<!-- <style type="text/css" src="css/style.css"></style> -->
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
<script type="text/javascript">
$(document).ready(function() {	
    $("#category").change(function(){
    	var selectedCategory=$('#category').val();
    	if(selectedCategory=="vehicles"){
			$(location).attr('href','BargainCntr?page=Vehicles');
		}
		else if(selectedCategory=="real estate"){
			
			$(location).attr('href','BargainCntr?page=BuyerLink');
		}
        /* $.ajax({
        	type:'POST',
			url:'BargainCntr?page=VehiclePage',
			data:{'selectedCategory':selectedCat},				
			success:function(data){
				if(data=="valid"){
					$(location).attr('href','BargainCntr?page=BuyerLink');
				}
				else if(data=="invalid"){
					
					$('#errorMessage').text("Invalid credentials");
				}
				else{
					$('#errorMessage').text("You are not yet authenticated. Please try after some time");
				}
			}
        }); */
    });
});
</script>
</head>
<body>
<%
HttpSession sess = request.getSession();
User user=(User)sess.getAttribute("user");	
ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("a1");
Asset[] a = new Asset[a1.size()];
for (int i = 0; i < a1.size(); i++) {
	a[i] = new Asset();
	a[i] = a1.get(i);
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



			<div class="col-sm-10">
				<nav class="navbar navbar-default navbar-custom">
				<div class="container-fluid">
					<form action="BargainCntr?page=searchAssets" method="post">
						<div class="col-sm-1 form-group" style="margin-top: 12px"><h4  style="color: orange">Category: </h4></div>
						<div class="col-sm-2 form-group" style="margin-top: 12px">						
							<select class="form-control" id="category" name="category">
								<option >Category</option>
								<option value="real estate">Real Estates</option>
								<option value="vehicles">Vehicle</option>								
							</select>

						</div>						
						<div class="col-sm-5 form-group" style="margin-top: 15px">
							<input type="text" class="form-control" id="searchBar" name="searchBar">
						</div>
						<div class="col-sm-2" style="margin-top: 15px">
							<button type="submit" class="btn btn-info" value="Search">
								<span class="glyphicon glyphicon-search"></span> Search	</button>
						</div>
						<div class="col-sm-2" style="margin-top: 15px">
							<button type="button" class="btn btn-warning"
								onclick='window.location.href="AddAsset.jsp"'>
								<span class="glyphicon glyphicon-home"></span> Sell Your Asset
							</button>
						</div>

						<br> <br>
					</form>
				</div>
				</nav>

					<%
					a1.get(0).getId();

					for (int i = 0; i < a1.size(); i++) {
				%>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading"><%=a[i].getAssetname()%></div>
						<div class="panel-body">
							<a
								href="BargainCntr?page=AssetsPage&asset=<%=a[i].getAssetname()%>"><img
								src='<%=a[i].getImage1()%>' class='img-responsive'
								style='width: 300px; height: 200px'
								alt='<%=a[i].getAssetname()%>'></a>

						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col-sm-2">
									<h4 align="right" style="color: blue">Price:</h4>
								</div>
								<div class="col-sm-6">
									<h4>
										$
										<%=a[i].getEprice()%></h4>
								</div>
							</div>
							<a href="BargainCntr?page=AssetsPage&asset=<%=a[i].getAssetname()%>"><%=a[i].getCategory()%></a>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>

		</div>
		<%
			} catch (IndexOutOfBoundsException e) {
				// TODO: handle exception
		%>
		<br> <br> <font color="red"><h3 align="center">
				<u>Such property is not available for sale now...</u>
			</h3></font><br> <br> <br>
		<%
			} catch (NullPointerException e) {
				// TODO: handle exception
				System.out.println("Unknown User");
				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>
	</div>
	<br>
	<br>

</body>
</html>
