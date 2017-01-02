<%@page import="model.Asset" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link href="css/animate-custom.css" rel="stylesheet"> -->
 <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/main.css" rel="stylesheet">
  <script src="js/jquery.min.js"></script>
   <link href="css/buyasset.css" rel="stylesheet">
<title>SellerAListB</title>
</head>
<body>
<center>		
<%
			HttpSession sess = request.getSession();
			ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("s1");
			Asset[] a = new Asset[a1.size()];
			for (int i = 0; i < a1.size(); i++) {
				a[i] = new Asset();
				a[i] = a1.get(i);
			}
		%>	
		
		   <section id="contact1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Check biding of your Asset</h2>
                    <h4>For SELLER</h4>
                      
                </div>
            </div>	
<%try {
	a1.get(0).getId();
%>
<form action="BargainCntr?page=Done" method="post">
<!-- <table border="1" style="width:90%"> -->
<table class="table table-bordered" border="2" style="width:90%;">
 <thead>
	<tr style="font-weight:bold;color: black;">
		<th>ID </th>
		<th>Asset-name</th>
		<th>Information</th>	
		<th>Category</th>
		<th>E-Price</th>
		<th>B-Price</th>
		<th>Buyer Name</th>
		<th>Asset-Status</th>
		<th>Sale</th>
	</tr>
	</thead>
		<%
				for (int i = 0; i < a1.size(); i++) {
		%>
		<tbody>
		<tr style="text-align:center; text-transform: capitalize;">
		<td><%=a[i].getId()%></td>
		<td><%=a[i].getAssetname()%></td>
		<td><%=a[i].getInfo()%></td>
		<td><%=a[i].getCategory()%></td>
		<td><%=a[i].getEprice()%></td>
		<td><%=a[i].getBprice()%></td>
		<td><%=a[i].getBname()%></td>
		<td><%=a[i].getIsvalid()%></td>
		<td><input type="submit" name="Done[<%=i%>]" value=" DONE " /></td>
	</tr>
<%
	} 
%>
</tbody>
</table>
		<br><br>
		<h3><a href="seller.jsp"><b>Back</b></a></h3><br>
		<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>
</form>
<%
	} catch (IndexOutOfBoundsException e) {
	// TODO: handle exception
		System.out.print("sagar ");
%>
		<br><br>
		<font color="red"><h2><u>your not salling anyone Asset here...</u></h2></font><br><br><br>
		<h3><a href="seller.jsp"><b>Back</b></a></h3>
		<br><br>
		<a href="Home.jsp">HOMEPAGE</a>	
		<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>
<% 		
	}
%>
</div>
</section>
</center>
</body>
</html>