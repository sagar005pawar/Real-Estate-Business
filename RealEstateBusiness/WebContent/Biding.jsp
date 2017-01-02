<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>BidinG</title>
 <link rel="stylesheet" type="text/css" href="css/style1.css" /> 
 <link type="text/css" href="css/animate-custom.css" rel="stylesheet">
 <link href="css/bootstrap.css" rel="stylesheet">
 <link type="text/css" href="css/main.css" rel="stylesheet">
 <script type="text/javascript" src="js/jquery.min.js"></script>
         
	<script type="text/javascript">
		function myFunc() {			
			alert("Your Biding is Added on that Asset-ID");
		}
	</script>

</head>

<body>
	<%	String i = request.getParameter("id");
		String epr = request.getParameter("eprice");
		String HBpr = request.getParameter("HBprice");
		String HBnm = request.getParameter("HBname");
	%>
 <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Bidding on Assets</h2>         
                </div>
            </div>
	
	<form action="BargainCntr?page=BidingPage&id=<%=i%>" method="post" onsubmit="return(myFunc())">	
		
		 <table class="table" border="1"style="width:50%">
   		 <thead></thead>
   		 <tbody style="color:white;">
			<tr><td><strong><u>Asset-ID</u> : </strong></td><td><strong><label> <%=i%></label></strong></td></tr>
			<tr></tr><tr></tr>
			<tr><td><strong><u>S-E-Price</u>: </strong></td><td><strong><label> <%=epr%></label></strong></td></tr>
			<tr></tr><tr></tr>
			<tr><td><strong><u>H-B-Price</u>: </strong></td><td><strong><label> <%=HBpr%></label></strong></td></tr>
<%	if(HBnm!=null) { %>		
			<!-- <tr></tr><tr></tr> -->
			<tr><td><strong><u>H-B-name</u>: </strong></td><td><strong><label class="HBnm"> <%=HBnm%></label></strong></td></tr>
<% } %>
		
		</tbody>
		</table>
<br>
	<strong style="color:white">Insert Your Biding Price:</strong><input type="text" id="bpr" name="bpr" required="required" /><br /><br />
		<button type="submit" class="btn btn-success">Submit</button>
	</form>
	
	<br><br>
		<a href="BargainCntr?page=BuyerLink"> Back </a>
</div>
</section>
</body>
</html>