<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@page import="model.Asset" %>
<%@page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		 <link href="css/animate-custom.css" rel="stylesheet">
		 <link href="css/bootstrap.css" rel="stylesheet">
  		 <link href="css/main.css" rel="stylesheet">
  		 <script src="js/jquery.min.js"></script> 
         
	<title>Bided Asset</title>
	
	<script type="text/javascript">
		function myFun() {
			alert("Sending Asset Bid-Price to Reviewer for authority...");
		}
	</script>
	<link rel="stylesheet" type="text/css" href="css/style1.css" />

</head>
<body>
<center>
<%
			HttpSession sess = request.getSession();
			
			ArrayList<Asset> a1 = (ArrayList<Asset>) sess.getAttribute("b1");
			Asset[] a = new Asset[a1.size()];
			
			for (int i = 0; i < a1.size(); i++) {
				a[i] = new Asset();
				a[i] = a1.get(i);
			}
		%>
<h1>Bidings on Asset</h1><br>
<%try {
		a1.get(0).getId();
 %>
			<strong><u>Asset ID</u>: <label><%=request.getParameter("id")%></label></strong>
			<br><br>
			<strong><u>E-Price</u>: <label><%=request.getParameter("eprice")%></label></strong>
			<br><br>
		<table border="1" style="width:60%;">
		<thead>
		<tr style="text-align:center; text-transform: capitalize;">
			<th>Biding Prices</th>
			<th>Buyer Name</th>
			<th>Send to Reviewer</th>
		</tr>
	</thead>
		<%
				for (int i = 0; i < a1.size(); i++) {
		%>
		<tbody>
		<tr style="text-align:center; text-transform: capitalize;">
			<td><%=a[i].getBprice()%></td>
			<td><%=a[i].getBname()%></td>
			<td><a class="send" href="BargainCntr?page=BidingSend&id=<%=a[i].getId()%>&bprice=<%=a[i].getBprice()%>
			&bname=<%=a[i].getBname()%>" onclick="return(myFun())" style=""><strong>Sending</strong></a></td>
		</tr>
		<%
				}
		%>
		</tbody>
		</table>
	<br><br>
		<h3><strong><a href="BargainCntr?page=NegotiatorLink">Back</a></strong></h3>
		<br/><a href="BargainCntr?page=Logout" >Logout</a>
<%
	} catch (IndexOutOfBoundsException e) {
	// TODO: handle exception
		System.out.print("\nIn bids db table not any one related id present like that, so : "+e);
%>			
		<strong><u>Asset ID</u>: <label><%=request.getParameter("id")%></label></strong>
		<h3>Not present anyone biding on this Asset-ID</h3><br><br>
		Ok! Back Now: <a href="BargainCntr?page=NegotiatorLink"><strong><u> BACK...</u></strong></a>
		<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>
<% 
	}
%>
</center>
</body>
</html>