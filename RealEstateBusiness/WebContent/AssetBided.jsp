<%@page import="model.Asset"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Asset Bided</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel='stylesheet' type='text/css' href="css/style1.css" />     
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
	
	HttpSession sess = request.getSession();
	User user = (User) sess.getAttribute("user");
	ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("b1");
    Asset asset=(Asset) sess.getAttribute("selectedAsset");
	Asset[] as1 = new Asset[a1.size()];
	for (int i = 0; i < a1.size(); i++) {
		as1[i] = new Asset();
		as1[i] = a1.get(i);
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
				<p class="lead text-primary" align="center">Asset Bid's List</p>
				<hr>
				
				<div class="row">
					<div class="col-lg-12 col-md-8">
						<div class="table-responsive">
							<table class="table table-striped">
								<%									
										as1[0].getId();
								%>
									<thead class="thead-success" style="background-color: lightgray">
									<tr>
			<th>Biding Prices</th>
			<th>Buyer Name</th>
			<th>Sendind for Authority</th>
									</tr>
								</thead>
								<%	
									for (int i = 0; i < a1.size(); i++) {
								%>	
								<tbody>																	
									<tr>
			<td><%=as1[i].getBprice()%></td>
			<td><%=as1[i].getBname()%></td>
			<td><a class="send" href="BargainCntr?page=AssetBidedApproved&id=<%=as1[i].getId()%>&bprice=<%=as1[i].getBprice()%>
			&bname=<%=as1[i].getBname()%>" onclick="return(myFun())"><strong>Approve</strong></a></td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>
							<br><br><br><br><br><br>							
						</div>
					</div>
				</div>


<hr>


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
			<form action="BargainCntr?page=BidingPage&id=<%=asset.getId()%>" method="post">
				<div class="row col-sm-offset-1">
					<div class="row" style="margin-bottom: 30px">
						<h1 align="center"><%=asset.getAssetname() %></h1>
					</div>
					<div class="row">
						<div class="col-sm-6" align="right"
							style="margin-top: 8px; font-size: 16">
							<b>Assets ID:</b>
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
							<b>Seller Name:</b>
						</div>
						<div class="col-sm-6 well well-sm"><%=asset.getSname() %></div>
					</div>

					<div class="col-sm-offset-6">
						<button type="button" class="btn btn-success" onclick='window.location.href="BargainCntr?page=NegotiatorLP"'><b>Back</b></button>						
					</div>
				</div>
				</form>
			</div>
			
			
		</div>
		<%
							} catch (IndexOutOfBoundsException e) {
									// TODO: handle exception
								System.out.print("\nIn user db table not any one related id present like that, so : " + e);
							%>
								<h3 align="center">No one Asset-Biding-Price present here, for Bargaining</h3>
							<%
								}
							%>
	</div>
</body>
</html>