<%@page import="model.Asset"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link href="css/animate-custom.css" rel="stylesheet">
 <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/main.css" rel="stylesheet">
  <script src="js/jquery.min.js"></script>
         <link href="css/buyasset.css" rel="stylesheet">
</head>
<body>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Purchase From here</h2>
                      
                </div>
            </div>
         
  <%
			HttpSession sess = request.getSession();
			ArrayList<Asset> a1 = (ArrayList<Asset>)sess.getAttribute("a1");
			
			Asset[] a = new Asset[a1.size()];
			
			for (int i = 0; i < a1.size(); i++) {
				a[i] = new Asset();
				a[i] = a1.get(i);
			}
			try {
				a1.get(0).getId();
         
     %>              
            <table class="table table-bordered">
            <thead>
     			 <tr style="font-weight:bold;color: white;">
        				<th>ID</th>
        				<th>Asset-name</th>
        				<th>Information</th>
        				<th>Category</th>
        				<th>Sell-E-Price</th>
        				<th>Select Asset</th>
        			
        				<!--location
        					type
        					features
        					seller
        					full description
        					button ad to cart,buy
        				
        				  -->
        				
      			</tr>
    		</thead>
    		
    		<%
				for (int i = 0; i < a1.size(); i++) {
	    	%>
 	
    		<tbody>
    			 <tr style="color:black; ;">
    			 <td><strong><a href="BargainCntr?page=highestbid&id=<%=a[i].getId()%>
        			&eprice=<%=a[i].getEprice()%>" style="text-decoration: none"><%=a[i].getId()%></a></strong></td>
					<td><%=a[i].getAssetname()%></td>
					<td><%=a[i].getInfo()%></td>
					<td><%=a[i].getCategory()%></td>
					<td><%=a[i].getEprice()%></td>
					<td><strong><a href="BargainCntr?page=highestbid&id=<%=a[i].getId()%>
					&eprice=<%=a[i].getEprice()%>" style="text-decoration: none;">Click Here</a></strong></td>
      			</tr>
    		<%
				}
			%>
    		
    	
    		</tbody>             
                  </table>
                  
                  
<%
	} catch (IndexOutOfBoundsException e) {
	// TODO: handle exception
%>
		<br><br>
		<font color="red"><h2><u>No-One Asset present here for buying...</u></h2></font><br><br><br>
<% 		
	}
%>
                  
                  <br><br><br>
					You want to <strong>Selling</strong> your Asset,Then- <a href="seller.jsp">Click Here</a> <br><br> <br><br>
					<a href="Home.jsp">HOMEPAGE</a><br>
					<h3><a href="BargainCntr?page=NegotiatorLink"  style="text-decoration: none">NegotiatoR</a></h3>
					<br/><br/><a href="BargainCntr?page=Logout" >Logout</a>
                  
                  
  </div>                        
 </section>                 
</body>
</html>