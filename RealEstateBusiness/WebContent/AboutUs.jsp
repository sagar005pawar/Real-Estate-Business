<%@page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>About Us</title>   
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

    <!-- Page Content -->
    <div class="container">

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About Us
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Team</h2>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

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

    <!-- Page Content -->
    <div class="container">

        <!-- Introduction Row -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">About Us
                    <small>It's Nice to Meet You!</small>
                </h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
            </div>
        </div>

        <!-- Team Members Row -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Our Team</h2>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
            <div class="col-lg-4 col-sm-6 text-center">
                <img class="img-circle img-responsive img-center" src="http://placehold.it/200x200" alt="">
                <h3>John Smith
                    <small>Job Title</small>
                </h3>
                <p>What does this team member to? Keep it short! This is also a great spot for social links!</p>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
				
<%
		System.out.println("Unknown User");
//				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>

</body>
</html>
