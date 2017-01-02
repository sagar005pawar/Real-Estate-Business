<%@page import="model.User" %>
<%@page import="model.Asset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Seller Selected Asset</title>
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
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

.imageStyle{
	height: 450px;
	width:  700px;
	
}
</style>

</head>
<body>
	<%
		HttpSession httpSession=request.getSession();
	
	    Asset asset = (Asset) httpSession.getAttribute("selectedAsset");
		User user = (User) httpSession.getAttribute("user");
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
	<div class="container">
		<div class="row">
			<div class="col-sm-offset=1 col-sm-7">
				<div class="row">
					<div id="myCarousel" class="carousel slide" data-ride="carousel" >
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
							<li data-target="#myCarousel" data-slide-to="4"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img src="<%=asset.getImage1() %>" alt="Image" style="width:700px; height: 450px">

							</div>

							<div class="item">
								<img src="<%=asset.getImage2() %>" alt="Image"
									style="width:700px; height: 450px">

							</div>

							<div class="item">
								<img src="<%=asset.getImage3() %>" alt="Image" style="width:700px; height: 450px">

							</div>

							<div class="item">
								<img src="<%=asset.getImage4() %>" alt="Image" style="width:700px; height: 450px">

							</div>
							<div class="item">
								<img src="<%=asset.getImage5() %>" alt="Image" style="width:700px; height: 450px">

							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="caption-full">
						<div class=" well well-sm">
							<h4>Description</h4>

						</div>
						<div class="well well-lg">
							
							<label>
								<%=asset.getCategory() %>
							</label>
							<p><%=asset.getInfo() %></p>
							<br> <br> <br> <br>
						</div>
					</div>

				</div>

			</div>
			<div class="col-sm-4">
			<form action="BargainCntr?page=SellerSelectedAssetPage&id=<%=asset.getId()%>" method="post">
				<div class="row col-sm-offset-1">
					<div class="row" style="margin-bottom: 30px">
						<h1 align="center"><%=asset.getAssetname() %></h1>
					</div>
					
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>ID:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getId() %></div>

					</div>
				
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Price:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getEprice() %></div>
					</div>
		
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Minimum Bid:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getBprice() %></div>
					</div>
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Buyer Name:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getBname() %></div>
					</div>
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Negotiator:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getNegotiator() %></div>
					</div>		

					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Asset-Status:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getIsvalid() %></div>
					</div>		

					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>SOLD:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getBstatus() %></div>
					</div>		
								
					<div class="col-sm-offset-6">
					<%if(("Authorized".equals(asset.getIsvalid())) && ("NOTHING".equals(asset.getBstatus()))) { %>
						<button type="submit" class="btn btn-success"><b>Show Bid's</b></button>
					<%} %>
						<button type="button" class="btn btn-success" onclick='window.location.href="BargainCntr?page=SelingAssetsList"'><b>Back</b></button>						
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<% 
			} catch (Exception e) {
				// TODO: handle exception
               
		System.out.println("Unknown User");
				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>
	
</body>
</html>