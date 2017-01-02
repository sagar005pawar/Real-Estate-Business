<%@page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link rel="stylesheet" href="css/datepicker.css">
 <!-- <link href="css/bootstrap.min.css" rel="stylesheet">
 <link href="css/bootstrap.css" rel="stylesheet"> -->
 
 <link href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
  <link href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/css/datepicker.min.css' rel='stylesheet' type='text/css'>
  <link href='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/css/bootstrap-switch.css' rel='stylesheet' type='text/css'>
  <link href='http://davidstutz.github.io/bootstrap-multiselect/css/bootstrap-multiselect.css' rel='stylesheet' type='text/css'>
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.0/js/bootstrap.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.2.0/js/bootstrap-datepicker.min.js' type='text/javascript'></script>
  <script src='//cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/1.8/js/bootstrap-switch.min.js' type='text/javascript'></script>
  <script src='http://davidstutz.github.io/bootstrap-multiselect/js/bootstrap-multiselect.js' type='text/javascript'></script>

  <!-- <link rel='stylesheet' type='text/css' href="css/style1.css" /> 
  <link rel='stylesheet' type='text/css' href="css/styleupload.css" />       
  <link rel="stylesheet" type='text/css' href="css/bootstrap.min.css">
  <script src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="javascript/jquery.min.js"></script>
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="images/best-Real-Estate-Logo-For-Blogger.jpg">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->


<title>Add Asset</title>
</head>

<body>
  <script>

  $(document).ready(function(){
		$("#firstRadio").click(function(){
			$("#firstAccordion").slideDown("slow");
			$("#secondAccordion").hide();
		});
		$("#secondRadio").click(function(){
			$("#secondAccordion").slideDown("slow");
			$("#firstAccordion").hide();
		});
	});

  
/*  
  
$('input[name="radios1"]').change( function() {

   if ($('#firstRadio').is(":checked")){

        $('#firstAccordion').collapse('show');

    } else {

        $('#firstAccordion').collapse('hide');
    }

    if ($('#secondRadio').is(":checked")){

     
    	$('#secondAccordion').collapse('show');
    	

    }  else {

        $('#firstAccordion').collapse('hide');
    }
   
   

});

$('input[name="radios2"]').change( function() {

	   if ($('#firstRadio').is(":checked")){

	        $('#firstAccordion').collapse('show');

	    } else {

	        $('#firstAccordion').collapse('hide');
	    }

	    if ($('#secondRadio').is(":checked")){

	     
	    	$('#secondAccordion').collapse('show');
	    	

	    }  else {

	        $('#firstAccordion').collapse('hide');
	    }
	   
	   

	});

*/
</script>

			<%
		HttpSession httpSession = request.getSession();
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

 
      <div class='container'>
      <form class='form-horizontal'role='form' action='BargainCntr?page=AssetAddd' method='post' name="AddAssetForm"> 
      
     <!--  <form class='form-horizontal'role='form'>   -->
       <div class="radio col-md-4 smoothScroll" id="firstRadio">
       Real-Estate
             <label><input type="radio" name="radios1"  class="track-order-change" id="firstRadio" value="" >Real-Estate</label>  
  </div>
          
       <div class="radio col-md-4 smoothScroll" id="secondRadio">
       Vechicle
            <label><input type="radio" name="radios2" class="track-order-change" id="secondRadio"> Vechicle</label>
           </div>
             
 <!-- </form>  --> 
       
      
       
      <!-- <div class="col-md-4">
           <div class="radio">
           <label><input type="radio" name="optradio">Real-Estate</label>
           </div>
    </div>
    		<div class="col-md-2">
            <div class="radio">
            <label><input type="radio" name="optradio">Vehicle</label>
             </div>
             </div> -->
      <!-----------------------------------------------------------------------------------------------------------------------------------------  -->

      <div class='panel panel-primary dialog-panel'>
      <div class='panel-body'>
           
           
          <div class="col-xs-12 panel-collapse collapse" id="firstAccordion">
            <div>
              
            <br>Real-Estate
            
       <!--  <form class='form-horizontal'role='form' action='BargainCntr?page=AssetAddd' method='post' name="AddAssetForm">    -->
       
        <div class="table-responsive">  
        <table class="table">
        <thead>
        <tr></tr>
        </thead>
        <tbody>
        <tr>
        <td>
           <div class='form-group' id="pdate">
            <div class='col-lg-4'>
            <label for="usr">Purchase Date:</label>
                <div class='form-group internal input-group'>
                  
       <div class='input-group date' id='dateRangePicker'>
                    <input type='text' class="form-control" name="pdate">
                    <span class="input-group-addon add-on">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
              </div> 
              
              
              
          </div>
          </div> 
         <script>
         $(document).ready(function() {
        	    $('#dateRangePicker')
        	        .datepicker({
        	            format: 'mm/dd/yyyy',
        	            startDate: '01/01/2010',
        	            endDate: '12/30/2020'
        	        })
        	        .on('changeDate', function(e) {
        	            // Revalidate the date field
        	            $('#dateRangeForm').formValidation('revalidateField', 'date');
        	        });

        	    $('#dateRangeForm').formValidation({
        	        framework: 'bootstrap',
        	        icon: {
        	            valid: 'glyphicon glyphicon-ok',
        	            invalid: 'glyphicon glyphicon-remove',
        	            validating: 'glyphicon glyphicon-refresh'
        	        },
        	        fields: {
        	            date: {
        	                validators: {
        	                    notEmpty: {
        	                        message: 'The date is required'
        	                    },
        	                    date: {
        	                        format: 'MM/DD/YYYY',
        	                        min: '01/01/2010',
        	                        max: '12/30/2020',
        	                        message: 'The date is not a valid'
        	                    }
        	                }
        	            }
        	        }
        	    });
        	});
         </script>
     
        
        </td>
        
        <td>
        
        
        </td>
       
        <td>
        <div class='form-group'>
            <div class='col-lg-4'>
            <div class="form-group">
  			<label for="usr">Asset Name:</label>
  			<input type="text" class="form-control" id="purchase_cost" name="asset_name">
			</div>
            
               </div>
          </div>
       </td>
       
        
        <td>
        <div class='form-group'>
            <div class='col-lg-4'>
            <div class="form-group">
  			<label for="usr">Purchase cost:</label>
  			<input type="text" class="form-control" id="purchase_cost" name="purchase_cost">
			</div>
            
               </div>
          </div>
       </td>
        </tr>
       
       
        
        <tr>
        <td>
      
              
                 <div class="form-group">
   				<div class='col-lg-12'> 
  				<label for="sel1">Property Type:</label>
  				<select class="form-control" id="ptype" name="ptype">
    			<option>Select</option>
    			<option>Single Flat</option>
    			<option>Town House</option>
    			<option>Condo</option>
  				</select>
	</div>
	</div>          
              
              
              
     </td>
      
        <td>  
           <div class="form-group">
   <div class='col-lg-12'> 
  <label for="sel1">Usage Type:</label>
  <select class="form-control" id="utype" name="utype">
    <option>Select</option>
    <option>Primary</option>
    <option>Rental</option>
    <option>Secondary</option>
  </select>
</div>
</div>          
              
              
     </td>
      
      
     
  
       </tr>
        </tbody>
        </table>
        </div>
       
        
 <!------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- 
           <div class='panel panel-primary dialog-panel'>
      <div class='panel-body'> -->
           <!-- <form class='form-horizontal'role='form'> -->  
           <h6>Address</h6> 
        <div class="table-responsive">  
        <table class="table">
     
        <thead>
        <tr></tr>
        </thead>
        <tbody>
        <tr>
        
        <td>
            <div class="form-group">
              <div  class="col-lg-12">
            
 			 <label for="usr">Street No:</label>
  			<input type="text" class="form-control" id="sno" name="sno">
			</div> 
			</div>
        </td>
    
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Street Name:</label>
  		<input type="text" class="form-control" id="street" name="street">
		</div> 
		</div>
        </td>
        </tr>
        
        <tr>
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">City Name:</label>
  		<input type="text" class="form-control" id="city" name="city">
		</div> 
		</div>
        </td>
        
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">State Name:</label>
  		<input type="text" class="form-control" id="state" name="state">
		</div> 
		</div>
        </td>  
       </tr>
       
       <tr>
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Country:</label>
  		<input type="text" class="form-control" id="country" name="country">
		</div> 
		</div>
        </td>  
        
         <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Zip:</label>
  		<input type="text" class="form-control" id="zip" name="zip">
		</div> 
		</div>
        </td>  
        
       </tr>
     
       </tbody>
        </table>
        </div>
      
      
       <div class="row">
				<div class="col-md-offset-4 col-md-2"><input type="submit" value="Next" class="btn btn-primary btn-block btn-md" tabindex="7"></div>
				<div class="col-md-2 col-md-2"><input type="reset" value="Reset" class="btn btn-primary btn-block btn-md" tabindex="7"></div>
			</div> 
   
       </div>
       </div>
       </div>
       </div>
      
      
 <!--=========================================================================================================================================  -->     
      
     
            <div class="col-xs-12 panel-collapse collapse" id="secondAccordion">
            <div>
            <br>
            
              Vechicle
           
      
        <div class='panel panel-primary dialog-panel'>
      <div class='panel-body'>
           
         
             
             
        <!-- <form class='form-horizontal'role='form' action='BargainCntr?page=AssetAdddvech' method='post' name="AddAssetForm">  -->  
       
       <div class="table-responsive">  
        <table class="table">
     
        <thead>
        <tr></tr>
        </thead>
        <tbody>
        <tr>
        
        <td>
            <div class="form-group">
              <div  class="col-lg-12">
            
 			 <label for="usr">Name:</label>
  			<input type="text" class="form-control" id="make" name="make">
			</div> 
			</div>
        </td>
    
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Model:</label>
  		<input type="text" class="form-control" id="model" name="model">
		</div> 
		</div>
        </td>
        </tr>
        
        <tr>
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Price:</label>
  		<input type="text" class="form-control" id="price" name="price">
		</div> 
		</div>
        </td>
        
        <td>
        <div class="form-group">
        <div  class="col-lg-12">
  		<label for="usr">Color:</label>
  		<input type="text" class="form-control" id="color" name="color">
		</div> 
		</div>
        </td>  
       </tr>
       
      
       </tbody>
        </table>
        </div>
      
      
       
       
          
         
 <!------------------------------------------------------------------------------------------------------------------------------------------->
        <!-- 
           <div class='panel panel-primary dialog-panel'>
      <div class='panel-body'> -->
           <!-- <form class='form-horizontal'role='form'> -->  
            
             <div class="table-responsive">  
        <table class="table">
        <thead>
        <tr></tr>
        </thead>
        <tbody>
        <tr>
     
        <td> 
    
  <div class='form-group' id="pdate">
            <div class='col-lg-4'>
            <label for="usr">Purchase Date:</label>
                <div class='form-group internal input-group'>
                  
       <div class='input-group date' id='dateRangePicker1'>
                    <input type='text' class="form-control" name="pdate1">
                    <span class="input-group-addon add-on">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
              </div> 
              
              
              
          </div>
          </div> 
         <script>
         $(document).ready(function() {
        	    $('#dateRangePicker1')
        	        .datepicker({
        	            format: 'mm/dd/yyyy',
        	            startDate: '01/01/2010',
        	            endDate: '12/30/2020'
        	        })
        	        .on('changeDate', function(e) {
        	            // Revalidate the date field
        	            $('#dateRangeForm').formValidation('revalidateField', 'date');
        	        });

        	    $('#dateRangeForm').formValidation({
        	        framework: 'bootstrap',
        	        icon: {
        	            valid: 'glyphicon glyphicon-ok',
        	            invalid: 'glyphicon glyphicon-remove',
        	            validating: 'glyphicon glyphicon-refresh'
        	        },
        	        fields: {
        	            date: {
        	                validators: {
        	                    notEmpty: {
        	                        message: 'The date is required'
        	                    },
        	                    date: {
        	                        format: 'MM/DD/YYYY',
        	                        min: '01/01/2010',
        	                        max: '12/30/2020',
        	                        message: 'The date is not a valid'
        	                    }
        	                }
        	            }
        	        }
        	    });
        	});
         </script>
     
        
        </td>
         <td>
      
              
                 <div class="form-group">
   				<div class='col-lg-12'> 
  				<label for="sel1">Status:</label>
  				<select class="form-control" id="status" name="status">
    			<option>Select</option>
    			<option>a</option>
    			<option>b</option>
    			<option>C</option>
  				</select>
	</div>
	</div>          
              
              
              
     </td>
      
       
        
        </tr>
        
        <tr>
        <td>
      
              
                 <div class="form-group">
   				<div class='col-lg-12'> 
  				<label for="sel1">Purchase Year:</label>
  				<!-- <select class="form-control" id="ptype" name="ptype">
    			<option>Select</option>
    			<option>Single Flat</option>
    			<option>Town House</option>
    			<option>Condo</option>
  				</select> -->
  				<input type="number" min="1900" max="2016" id="year" name="year">
	</div>
	</div>          
              
              
              
     </td>
      
        <td>  
           <div class="form-group">
   <div class='col-lg-12'> 
  <label for="sel1">Condition:</label>
  <select class="form-control" id="condition" name="condition">
    <option>Select</option>
    <option>a</option>
    <option>b</option>
    <option>c</option>
  </select>
</div>
</div>          
              
              
     </td>
      
     
       
       </tr>
        </tbody>
        </table>
        </div>
     
      
      
       <div class="row">
				<div class="col-md-offset-4 col-md-2"><input type="submit" value="Next" class="btn btn-primary btn-block btn-md" tabindex="7"></div>
				<div class="col-md-2 col-md-2"><input type="reset" value="Reset" class="btn btn-primary btn-block btn-md" tabindex="7"></div>
			</div> 
       
    </div>
       </div>
       </div> 
      </div>
    
    
      </form>
      </div>
     
      
    </div>
     
       
      
     
        
         <script src="js/index.js"></script>
         <script src="js/bootstrap.min.js"></script>
               <script src="js/bootstrap.js"></script>
             

<% 
			} catch (Exception e) {
				// TODO: handle exception
               
		System.out.println("Unknown User");
				response.sendRedirect("BargainCntr?page=Logout");
			}
		%>
        
</body>
</html>