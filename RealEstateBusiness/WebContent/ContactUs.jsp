<%@page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <title>Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
</head>
<body>
			<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		try {
			user.getReviewer();
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


<div class="page-header">
    <h1>Contact us <small>...be the part of our small world</small></h1>
</div>

<!-- Contact with Map - START -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="well well-sm">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <legend class="text-center header">Contact us</legend>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="email" name="email" type="text" placeholder="Email Address" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <div class="panel panel-default">
                    <div class="text-center header">Our Office</div>
                    <div class="panel-body text-center">
                        <h4>Address</h4>
                        <div>
                        A6/502, Ganga Satellite
                        Wanawadi, Pune - 411040.<br />
                        Maharashtra<br />
                        India <br />
                        +91-20-26854529 <br />
                        </div>
                        <hr />
                        <div id="map1" class="map">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
    jQuery(function ($) {
        function init_map1() {
            var myLocation = new google.maps.LatLng(19.1609, 72.9938);
            var mapOptions = {
                center: myLocation,
                zoom: 16
            };
            var marker = new google.maps.Marker({
                position: myLocation,
                title: "Property Location"
            });
            var map = new google.maps.Map(document.getElementById("map1"),
                mapOptions);
            marker.setMap(map);
        }
        init_map1();
    });
</script>

<style>
    .map {
        min-width: 300px;
        min-height: 300px;
        width: 100%;
        height: 100%;
    }

    .header {
        background-color: #F5F5F5;
        color: #36A0FF;
        height: 70px;
        font-size: 27px;
        padding: 10px;
    }
</style>

<!-- Contact with Map - END -->

</div>
		<%
			} catch (Exception e) {
				// TODO: handle exception
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
		        <li><a href="LoginPage.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
	</nav>

<div class="container">


<div class="page-header">
    <h1>Contact us <small>...be the part of our small world</small></h1>
</div>

<!-- Contact with Map - START -->
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="well well-sm">
                <form class="form-horizontal" method="post">
                    <fieldset>
                        <legend class="text-center header">Contact us</legend>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="fname" name="name" type="text" placeholder="First Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="lname" name="name" type="text" placeholder="Last Name" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="email" name="email" type="text" placeholder="Email Address" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <input id="phone" name="phone" type="text" placeholder="Phone" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-10 col-md-offset-1">
                                <textarea class="form-control" id="message" name="message" placeholder="Enter your massage for us here. We will get back to you within 2 business days." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div>
                <div class="panel panel-default">
                    <div class="text-center header">Our Office</div>
                    <div class="panel-body text-center">
                        <h4>Address</h4>
                        <div>
                        A6/502, Ganga Satellite
                        Wanawadi, Pune - 411040.<br />
                        Maharashtra<br />
                        India <br />
                        +91-20-26854529 <br />
                        </div>
                        <hr />
                        <div id="map1" class="map">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="http://maps.google.com/maps/api/js?sensor=false"></script>

<script type="text/javascript">
    jQuery(function ($) {
        function init_map1() {
            var myLocation = new google.maps.LatLng(19.1609, 72.9938);
            var mapOptions = {
                center: myLocation,
                zoom: 16
            };
            var marker = new google.maps.Marker({
                position: myLocation,
                title: "Property Location"
            });
            var map = new google.maps.Map(document.getElementById("map1"),
                mapOptions);
            marker.setMap(map);
        }
        init_map1();
    });
</script>

<style>
    .map {
        min-width: 300px;
        min-height: 300px;
        width: 100%;
        height: 100%;
    }

    .header {
        background-color: #F5F5F5;
        color: #36A0FF;
        height: 70px;
        font-size: 27px;
        padding: 10px;
    }
</style>

<!-- Contact with Map - END -->


				
<%
		System.out.println("Unknown User");
//				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>

</body>
</html>