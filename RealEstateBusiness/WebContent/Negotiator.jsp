<%@page import="model.Asset" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <link rel="stylesheet" type="text/css" href="css/stylenigo.css" />
 		 <link href="css/animate-custom.css" rel="stylesheet">
		 <link href="css/bootstrap.css" rel="stylesheet">
  		 <link href="css/main.css" rel="stylesheet">
  		 <script src="js/jquery.min.js"></script> 
         
	<title>Negotiator</title>
</head>
<body>

	<!-- <br><h2>Assets-List for Negotiator</h2><br>							Heading 
 -->
<%
			HttpSession sess = request.getSession();
			ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("a1");
			Asset[] a = new Asset[a1.size()];
			
			for (int i = 0; i < a1.size(); i++) {
				a[i] = new Asset();
				a[i] = a1.get(i);
			}
			try {
				a1.get(0).getId();
%>

<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading" style="color:black;">Assets-List for Negociator</h2>         
                </div>
            </div>

<table class="table table-striped" style="width:100%" align="center">
   		
<thead style="color:black; font:bold; text-align: center;" align="center" >		
	<tr>
		<th>ID </th>
		<th>Asset-name</th>
		<th>Information</th>	
		<th>Category</th>
		<th>Sell-E-Price</th>
		<th>Seller Name</th>
		<th>Select Choice</th>
	</tr>
	</thead>
		<%
				for (int i = 0; i < a1.size(); i++) {
		%>
	
	<tbody style="text-align:center; text-transform: capitalize;">
		<td><strong><a href="BargainCntr?page=BidingTable&id=<%=a[i].getId()%>
		&eprice=<%=a[i].getEprice()%>" style="text-decoration: none"><%=a[i].getId()%></a></strong></td>
		<td><%=a[i].getAssetname()%></td>
		<td><%=a[i].getInfo()%></td>
		<td><%=a[i].getCategory()%></td>
		<td><%=a[i].getEprice()%></td>
		<td><%=a[i].getSname()%></td>
		<td><a href="BargainCntr?page=BidingTable&id=<%=a[i].getId()%>
		&eprice=<%=a[i].getEprice()%>" style="text-decoration: none">Check <strong>Bidings</strong></a></td>
	</tbody>
		<%
				}
		%>	
</table>
<%
	} catch (IndexOutOfBoundsException e) {
	// TODO: handle exception
%>
		<br><br>
		<font color="red"><h2><u>No-One Asset present here for Bargaining...</u></h2></font><br><br><br>
<% 		
	}
%>

<br><br>
You want to <strong>Sale</strong> your Asset,Then- <a href="seller.jsp">Click Here</a> <br><br>
You want to <strong>Buy</strong> anything from here, Then- <a href="BargainCntr?page=BuyerLink">Click Here</a><br><br>
<a href="Home.jsp">HOMEPAGE</a>
<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>

</div>
</section>
</body>
</html>