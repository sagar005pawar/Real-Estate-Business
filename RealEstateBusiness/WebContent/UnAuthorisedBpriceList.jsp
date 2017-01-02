<%@page import="model.User"%>
<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UnAuthorize Biding</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel='stylesheet' type='text/css' href="css/style1.css" />     
  <link rel="stylesheet" type='text/css' href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="javascript/jquery.min.js"></script>

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




</head>
<body>

		<%
			HttpSession sess = request.getSession();
			User user = (User) sess.getAttribute("user");
			ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("a1");
			Asset[] as1 = new Asset[a1.size()];
			for (int i = 0; i < a1.size(); i++) {
				as1[i] = new Asset();
				as1[i] = a1.get(i);
			}
			try {
		 %>
		 
	<form action="BargainCntr?page=UnAuthorisedBpriceList" method="post">
		 
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
				<h2>Logo</h2>
				
				<ul class="nav nav-pills nav-stacked">
					<li  class="active"><a href="BargainCntr?page=BuyerLink">Properties</a></li>
					<%if(("authenticated").equals(user.getReviewer()) || ("admin").equals(user.getName())){ %>
						<li><a href="UserController?page=ReviewerUnUthorisedListRefresh">View Unauthorized users</a></li>
						<li><a href="BargainCntr?page=UnAAssetsLRefresh">View Unauthorized Assets</a></li>
					<%} 
					if(("authenticated").equals(user.getNegotiator()) || ("admin").equals(user.getName())){ %>
						<li><a href="BargainCntr?page=NegotiatorLP">View B-prices for Negotiation</a></li>
					<%} if(("admin").equals(user.getName())){ %>
						<li><a href="BargainCntr?page=AuthorizerApprvingBid-price">Approve Bid-Prices for Authority</a></li>
						<li><a href="UserController?page=AdminHomePage">Approve roles</a></li>
					<%} if(("author").equals(user.getName())){ %>
						<li><a href="BargainCntr?page=AuthorizerApprvingBid-price">Approve Bid-Prices for Authority</a></li>
					<%} %>
				</ul>
				<br>
			</div>

			<div class="col-md-9 col-lg-10 main">

				<!--toggle sidebar button-->

				<hr>
				<p class="lead text-primary" align="center">Un-Authorized Assets List</p>

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
				<th>ID</th>
				<th>Asset-name</th>
				<th>INFO</th>
				<th>Category</th>
				<th>E-Price</th>
				<th>B-Price</th>
				<th>Seller-name</th>
				<th>Buyer-Name</th>
				<th>Negotiator</th>
									</tr>
								</thead>
								<%	
									for (int i = 0; i < a1.size(); i++) {
								%>	
								<tbody>																	
									<tr>
				<td><%=as1[i].getId()%></td>
				<td><%=as1[i].getAssetname()%></td>
				<td><%=as1[i].getInfo()%></td>
				<td><%=as1[i].getCategory()%></td>
				<td><%=as1[i].getEprice()%></td>
				<td><%=as1[i].getBprice()%></td>
				<td><%=as1[i].getSname()%></td>
				<td><%=as1[i].getBname()%></td>
				<td><%=as1[i].getNegotiator()%></td>					
										<td><input type="submit" name="btn[<%=i%>]"
											value="Approve" align="middle"></td>
									</tr>
									<%
										}
									%>

								</tbody>
							</table>							
						</div>
					</div>
				</div>



			</div>

		</div>

		
	</div>
	<br>
	<br>
</form>
<%
							} catch (IndexOutOfBoundsException e) {
									// TODO: handle exception
								System.out.print("\nIn user db table not any one related id present like that, so : " + e);
							%>
								<h3 align="center">No one Asset-Biding-Price are Un-Authorized</h3>
							<%
								}
							%>
</body>
</html>