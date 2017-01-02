package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import db.DAO;
import db.Database;
import model.Asset;
import model.User;
import model.Vehicle;

@WebServlet("/BargainCntr")
public class BargainCntr extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    public BargainCntr() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession sess = request.getSession();
		User u1=(User)sess.getAttribute("user");			

		String page = request.getParameter("page");
		System.out.println("page= "+page);

		ArrayList<Asset> a1= new ArrayList<Asset>();
		ArrayList<Vehicle> vehicleArrayList= new ArrayList<Vehicle>();
		int i;
		PrintWriter pw = response.getWriter();

		String id,str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,user,pass;

		
		String searchAssets;
		double eprice,bprice;
		Asset as1;
		Vehicle vehicle;
		DAO d1;

		switch (page) {

		case "Logout":
		{
			sess.invalidate();
			response.sendRedirect("LoginPage.jsp");
			break;
		}

		
		case "VehicleAssetsFilteration":
		{
			try {
			str1=request.getParameter("a");
			str2=request.getParameter("b");
			str3=request.getParameter("c");

			str4=request.getParameter("d");
			str5=request.getParameter("e");
			str6=request.getParameter("f");

			System.out.println(str1+"\t"+str2+"\t"+str3+"\t"+str4+"\t"+str5+"\t"+str6);
			
/**/			
			String category =(String) sess.getAttribute("category");
			System.out.println(category);
/**/			
			d1=new DAO();
			vehicleArrayList= new ArrayList<Vehicle>();
			vehicleArrayList=d1.filteredVehicleAssest(category,str1,str2,str3,str4,str5,str6);
			sess.setAttribute("vehicleArrayList", vehicleArrayList);
			response.sendRedirect("Vehicles.jsp");//jsp	
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			break;
		}

		
		
		
		
		case "BiderAssetsList":
		{
			try {
				d1=new DAO();
				a1=d1.BiderAssestsDispaly(u1.getName());	
				sess.setAttribute("a1", a1);
				response.sendRedirect("BiderAssets.jsp");//jsp	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				//response.sendRedirect("BargainCntr?page=Logout");
			}			
			break;
		}
		case "BiderAssetsPage":														
		{	
			try {

			System.out.println("In Asset Page");
			String assetName=request.getParameter("asset");
			sess=request.getSession();
			ArrayList<Asset> assetArrayList=(ArrayList<Asset>) sess.getAttribute("a1");
			Asset asset = null;
			for(Asset tempAsset:assetArrayList){
				if(tempAsset.getAssetname().equals(assetName)){
					asset=tempAsset;
					break;
				}
			}
				d1=new DAO();
				a1= new ArrayList<Asset>();
				a1=d1.BuyerAssestBidings(asset.getId(), u1.getName());
				sess.setAttribute("BuyerBids", a1);
				
				sess.setAttribute("selectedAsset", asset);
				response.sendRedirect("BuyerBids.jsp");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

		
		case "AssetsFilteration":
		{
			try {
				str1=request.getParameter("singleflat");
				str2=request.getParameter("townhouse");
				str3=request.getParameter("condo");

				str4=request.getParameter("primary");
				str5=request.getParameter("rental");
				str6=request.getParameter("secondary");

				System.out.println(str1+"\t"+str2+"\t"+str3+"\t"+str4+"\t"+str5+"\t"+str6);
				
	/**/			
				String category=(String) sess.getAttribute("category");
				System.out.println(category);
	/**/			
				d1=new DAO();
				a1= new ArrayList<Asset>();
				a1=d1.filteredAssest(category,str1,str2,str3,str4,str5,str6);
				sess.setAttribute("a1", a1);
				response.sendRedirect("Assets.jsp");//jsp	
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			break;
		}
		
		
		case "NegotiatorLP":																
		{
			try {
				d1=new DAO();
				a1=d1.NegotiatorAssestDispaly();	
				sess.setAttribute("a1", a1);
				response.sendRedirect("Negotiation.jsp");//jsp	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				//response.sendRedirect("BargainCntr?page=Logout");
			}
			break;
		}

		
		case "AssetBidedPage":												
		{			
			try {

				String assetName=request.getParameter("asset");
				sess=request.getSession();
				ArrayList<Asset> assetArrayList=(ArrayList<Asset>) sess.getAttribute("a1");
				Asset asset = null;
				for(Asset tempAsset:assetArrayList){
					if(tempAsset.getAssetname().equals(assetName)){
						asset=tempAsset;
						break;
					}
				}
				sess.setAttribute("selectedAsset", asset);

				id = request.getParameter("id");				
				d1=new DAO();
				a1=d1.BidingDisplay(id);
				sess.setAttribute("b1", a1);

				response.sendRedirect("AssetBided.jsp");			//.jsp					

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch SQLException in AssetBidedPage case");
			}
			break;
		}

		
		/* biding send by negotiator to Authorizer */	
		case "AssetBidedApproved":														
		{
			try {			
				u1=(User)sess.getAttribute("user");
				id = request.getParameter("id");
				bprice = Double.parseDouble(request.getParameter("bprice"));
				str1 = request.getParameter("bname");
				System.out.println("id="+id+"\t"+"bname= "+str1+"\t"+"bprice="+bprice+"\t"+"Negotiator="+u1.getName());	
				d1=new DAO();
				d1.BidingSending(id,str1,bprice,u1.getName());
				response.sendRedirect("BargainCntr?page=NegotiatorLP");//jsp	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch");
			}
			break;
		}
		
		
		case "AuthorizingPage":
		{
			try {
				id = request.getParameter("id");
				Asset asset=(Asset) sess.getAttribute("selectedAsset");
				d1=new DAO();
				String set;
				set = d1.AthonticateBPrice(asset);
				if(set=="AuthorizedBidingPrice"){
					response.sendRedirect("BargainCntr?page=AuthorizerApprvingBid-price");
				}else{
					response.sendRedirect("Authorizing.jsp?msg=	Not Authorized/Approved");					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				response.sendRedirect("Authorizing.jsp?msg=	Not Authorized/Approved");
			}
			break;
		}
		
		
		case "AuthorizerApprvingBid-price":
		{
			try {
				d1=new DAO();
				a1= new ArrayList<Asset>();
				a1=d1.getAssetsforAuthorizer();
				sess.setAttribute("Authority", a1);				
				response.sendRedirect("Authorizer.jsp");		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			break;
		}
		
		
		case "AuthorizerPage":
		{
			String assetID=request.getParameter("asset");
			ArrayList<Asset> assetArrayList=(ArrayList<Asset>) sess.getAttribute("Authority");
			Asset asset = null;
			for(Asset tempAsset:assetArrayList){
				if(tempAsset.getId().equals(assetID)){
					asset=tempAsset;
					break;
				}
			}
			sess.setAttribute("selectedAsset", asset);
			response.sendRedirect("Authorizing.jsp");
			break;
		}


		case "AssetsPage":														
		{	
			System.out.println("In Asset Page");
			String assetName=request.getParameter("asset");
			sess=request.getSession();
			ArrayList<Asset> assetArrayList=(ArrayList<Asset>) sess.getAttribute("a1");
			Asset asset = null;
			for(Asset tempAsset:assetArrayList){
				if(tempAsset.getAssetname().equals(assetName)){
					asset=tempAsset;
					break;
				}
			}
			sess.setAttribute("selectedAsset", asset);
			response.sendRedirect("ViewSelectedAsset.jsp");
			break;
		}

		

		
		
		/* Displaying assets for Buyer page (Buyer Homepage) */
		case "BuyerLink":																
		{
			try {
				as1 = new Asset();				
				as1.setCategory("real estate");
				System.err.println("Category= "+as1.getCategory());
				sess.setAttribute("category", as1.getCategory());													

				d1=new DAO();
				a1=d1.BuyerAssestDispaly(as1.getCategory());	
				sess.setAttribute("a1", a1);
				response.sendRedirect("Assets.jsp");//jsp	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		
		
				
		//Biding added by buyer (Entered biding by buyer for particular an asset)
		case "BidingPage":									
		{
			id = request.getParameter("id");
			bprice = Double.parseDouble(request.getParameter("bidPrice"));
			System.out.println(id+"\t"+bprice+"\t"+u1.getName());
			try {
				d1=new DAO();
				d1.Bidingadd(id, bprice,u1.getName());
				System.out.println("Entered biding price");
				response.sendRedirect("Assets.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		
				

		
		/* check biding Asset-id selecting by negotiator  */
		case "BidingTable":												
		{			
			id=request.getParameter("id");
			eprice=Double.parseDouble(request.getParameter("eprice"));
			System.out.println("id="+id+"\t"+"eprice="+eprice);			
			try {
				d1=new DAO();
				a1=d1.BidingDisplay(id);
				sess.setAttribute("b1", a1);
				response.sendRedirect("BidedAsset.jsp?id="+id+"&eprice="+eprice);			//.jsp					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch");
			}
			break;
		}	

		/* biding send by negotiator to Reviewer */	
		case "BidingSend":														
		{
			try {			
				u1=(User)sess.getAttribute("u1");
				id = request.getParameter("id");
				bprice = Double.parseDouble(request.getParameter("bprice"));
				str1 = request.getParameter("bname");
			
				System.out.println("id="+id+"\t"+"bname= "+str1+"\t"+"bprice="+bprice+"\t"+"Negotiator="+u1.getName());	
			
				d1=new DAO();
				d1.BidingSending(id,str1,bprice,u1.getName());
				response.sendRedirect("BargainCntr?page=NegotiatorLink");//jsp	
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch");
			}
			break;
		}

		
		
		
		
		/* Un-Authrized-Assets-Biding-Prices for Reviewer   */
		case "UnAABpriceRefresh":
		{
			try {
				d1=new DAO();
				a1 = d1.getUnAuthorisedBprice();
				sess.setAttribute("a1", a1);
				sess.setAttribute("size", a1.size());
				// response.sendRedirect("UnAuthorisedUserList.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("UnAuthorisedBpriceList.jsp");
				rd.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			
			break;
		}
		
		
		
/* Authonticate the asset Biding-Price   */
		case "UnAuthorisedBpriceList":
		{
			a1 = (ArrayList<Asset>) sess.getAttribute("a1");
			for (i = 0; i < a1.size(); i++) {
				if (request.getParameter("btn[" + i + "]") != null) {
					break;
				}
			}
			id = a1.get(i).getId();
			System.out.println("id= "+id);
			try {
				d1 = new DAO();
				if (d1.authenticateBprice(id)) {
					response.sendRedirect("BargainCntr?page=UnAABpriceRefresh");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			break;
		}

		
		/* To get the Highest Biding-Price information for Buyer   */
		case "highestbid":
		{
			id = request.getParameter("id"); 
			eprice = Double.parseDouble(request.getParameter("eprice"));
			try {
				d1 =new DAO();
				as1 = d1.searchHB(id);
				System.out.println("u1= "+u1.getName()+"\t"+"as1= "+as1.getBname());

				if(u1.getName().equals(as1.getBname())){				
					response.sendRedirect("Biding.jsp?id="+id+"&eprice="+eprice+"&HBprice="+as1.getBprice()+"&HBname="+as1.getBname());
				}else {
					response.sendRedirect("Biding.jsp?id="+id+"&eprice="+eprice+"&HBprice="+as1.getBprice());					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

		
		
		/* Un-Authorized-Asset-List-Refresh Displaying for Administrator   */
		case "UnAAssetsLRefreshForAdmin":
		{
			try {
				d1=new DAO();
				a1 = d1.getUnAuthorisedAssets();
				sess.setAttribute("a1", a1);
				sess.setAttribute("size", a1.size());
				// response.sendRedirect("UnAuthorisedUserList.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("AdminUnAuthorisedAssetsList.jsp");
				rd.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			break;
		}

		
		/* Approve the Asset authenticate by Administrator   */
		case "UnAuthorisedAssetListForAdmin":
		{
			a1 = (ArrayList<Asset>) sess.getAttribute("a1");
			for (i = 0; i < a1.size(); i++) {
				if (request.getParameter("btn[" + i + "]") != null) {
					break;
				}
			}
			id = a1.get(i).getId();
			System.out.println("id= "+id);
			try {
				d1 = new DAO();
				if (d1.authenticateAsset(id)) {
					response.sendRedirect("BargainCntr?page=UnAAssetsLRefreshForAdmin");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			break;
		}

		
		/* Un-Authorized-Asset-List-Refresh Displaying for Reviewer   */
		case "UnAAssetsLRefresh":
		{
			try {
				d1=new DAO();
				a1 = d1.getUnAuthorisedAssets();
				sess.setAttribute("a1", a1);
				sess.setAttribute("size", a1.size());
				// response.sendRedirect("UnAuthorisedUserList.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("UnAuthorisedAssetsList.jsp");
				rd.forward(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			break;
		}

		
		
		/* Approve the Asset authenticate by Reviewer   */		
		case "UnAuthorisedAssetList":
		{
			a1 = (ArrayList<Asset>) sess.getAttribute("a1");
			for (i = 0; i < a1.size(); i++) {
				if (request.getParameter("btn[" + i + "]") != null) {
					break;
				}
			}
			id = a1.get(i).getId();
			System.out.println("id= "+id);
			try {
				d1 = new DAO();
				if (d1.authenticateAsset(id)) {
					response.sendRedirect("BargainCntr?page=UnAAssetsLRefresh");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			break;
		}
		
		/* Un-Authorized-Asset-List-Refresh Displaying for Reviewer   */
		case "UnAuthorizedVehiclesList":
		{
			try {
				d1=new DAO();
				vehicleArrayList = d1.getUnAuthorisedVehicles();
				sess.setAttribute("vehicleArrayList", vehicleArrayList);
				// response.sendRedirect("UnAuthorisedUserList.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("UnAuthorizedVehiclesList.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}				
			break;
		}

		
		
		/* Approve the Asset authenticate by Reviewer   */		
		case "UnAuthorizedVehicleListRefresh":
		{
			vehicleArrayList = (ArrayList<Vehicle>) sess.getAttribute("vehicleArrayList");
			for (i = 0; i < vehicleArrayList.size(); i++) {
				if (request.getParameter("btn[" + i + "]") != null) {
					break;
				}
			}
			id = vehicleArrayList.get(i).getId();
			
			try {
				d1 = new DAO();
				if (d1.authenticateVehicle(id)) {
					response.sendRedirect("BargainCntr?page=UnAuthorizedVehiclesList");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}					
			break;
		}

		
		
		/* Displaying assets for Buyer page (Buyer Homepage) */
		
		/* Displaying assets for Buyer page (Buyer Homepage) */
		case "Vehicles":																
		{
			try {
				as1 = new Asset();				
				as1.setCategory("Vehicle");
				System.err.println("Category= "+as1.getCategory());
				sess.setAttribute("category", as1.getCategory());													

				d1=new DAO();
				vehicleArrayList=d1.getVehicles(as1.getCategory());	
				if(vehicleArrayList!=null)
				{
					sess.setAttribute("vehicleArrayList", vehicleArrayList);
					response.sendRedirect("Vehicles.jsp");//jsp	
				}
				else {
				//response.sendRedirect("register.jsp?msg=Invalid User");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}		
		
		case "VehicleBidingPage":									
		{
			id = request.getParameter("id");
			bprice = Double.parseDouble(request.getParameter("bidPrice"));
			System.out.println(id+"\t"+bprice+"\t"+u1.getName());
			try {
				d1=new DAO();
				d1.Bidingadd(id, bprice,u1.getName());
				System.out.println("Entered biding price");
				response.sendRedirect("Vehicles.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

		

			
		// Asset Add by SELLER (Req. coming from seller page)	
		case "AssetAdd":	
			//u1=(User) sess.getAttribute("user");
			str1=request.getParameter("aname");
			str2=request.getParameter("info");
			str3=request.getParameter("category");
			eprice=Double.parseDouble(request.getParameter("eprice"));

			System.out.println("sname= "+u1.getName());			

			as1=new Asset();
			
			as1.setAssetname(str1);
			as1.setInfo(str2);
			as1.setCategory(str3);
			as1.setEprice(eprice);
			as1.setSname(u1.getName());;

			try {
				d1= new DAO();
				boolean status=d1.AssestAdd(as1);														//Add fun called here for Seller Asset
				if(status)
				{
					sess=request.getSession();
					sess.setAttribute("addAsset", as1);
					response.sendRedirect("UploadAssetImages.jsp");	
					//response.sendRedirect("BargainCntr?page=SABid");				//Then next Display the Asset table to Seller(Cntr goto SelingListLink case)
				}else{
					response.sendRedirect("ÄddAsset.jsp");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
			
			// Add Vehicle to database from seller	
					case "AddVehicle":	
						//u1=(User) sess.getAttribute("user");
						str1=request.getParameter("aname");
						str2=request.getParameter("info");
						str3=request.getParameter("category");
						eprice=Double.parseDouble(request.getParameter("eprice"));

						vehicle=new Vehicle();
						
						vehicle.setVehicleName(str1);
						vehicle.setInfo(str2);
						vehicle.setCategory(str3);
						vehicle.setEprice(eprice);
						vehicle.setSname(u1.getName());

						try {
							d1= new DAO();
							boolean status=d1.AddVehicle(vehicle);														//Add fun called here for Seller Asset
							if(status)
							{
								sess=request.getSession();
								sess.setAttribute("addVehicle", vehicle);
								response.sendRedirect("UploadVehicleImages.jsp");	
								//response.sendRedirect("BargainCntr?page=SABid");				//Then next Display the Asset table to Seller(Cntr goto SelingListLink case)
							}else{
								response.sendRedirect("ÄddVehicle.jsp");
							}
							
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						break;

			
			
		//when the asset added by seller then next process this case i.e. Displaying the Assets to seller  	
		case "SelingAssetsList":													
		{	
			try {
				System.out.println("seller name= "+u1.getName());
				d1=new DAO();
//				a1=d1.AssestDispaly();	
				a1=d1.SellerADispaly(u1.getName());
				sess.setAttribute("a1", a1);
				response.sendRedirect("SellerAssets.jsp");//jsp	
//				response.sendRedirect("register.jsp?msg=Invalid User");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}

		
		case "SellerAssetsPage":														
		{
			System.out.println("In seller Asset Page");
			String assetName=request.getParameter("asset");
			sess=request.getSession();
			ArrayList<Asset> assetArrayList=(ArrayList<Asset>) sess.getAttribute("a1");
			Asset asset = null;
			for(Asset tempAsset:assetArrayList){
				if(tempAsset.getAssetname().equals(assetName)){
					asset=tempAsset;
					break;
				}
			}
			sess.setAttribute("selectedAsset", asset);
			response.sendRedirect("SellerSelectedAsset.jsp");
			break;
		}

		case "SellerSelectedAssetPage":												
		{			
			try {
			    Asset asset=(Asset) sess.getAttribute("selectedAsset");
				sess.setAttribute("selectedAsset", asset);

				id = request.getParameter("id");				

				d1=new DAO();
				a1=d1.BidingDisplay(id);
				sess.setAttribute("b1", a1);

				response.sendRedirect("SellerAssetBidings.jsp");			//.jsp					

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch SQLException in AssetBidedPage case");
			}
			break;
		}
		
		
		/* biding send by negotiator to Authorizer */	
		case "SellerAssetBidSend":														
		{
			try {			
				u1=(User)sess.getAttribute("user");
				id = request.getParameter("id");
				bprice = Double.parseDouble(request.getParameter("bprice"));
				str1 = request.getParameter("bname");
				System.out.println("id="+id+"\t"+"bname= "+str1+"\t"+"bprice="+bprice+"\t"+"Negotiator="+u1.getName());	
				d1=new DAO();
				d1.BidingSending(id,str1,bprice,u1.getName());
				response.sendRedirect("BargainCntr?page=SelingAssetsList");//jsp	
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("catch");
			}
			break;
		}

		
		
		
		//find Seller Asset by id for checking B-price on his Assets
		case "SABid":													
			System.out.println("uname= "+u1.getName());
			try {
				d1=new DAO();
				a1=d1.SellerADispaly(u1.getName());
				if(a1!=null)
				{
					sess.setAttribute("s1", a1);
					response.sendRedirect("SellerAListB.jsp");//jsp					//Go to 'SellerAListB.jsp' page Displaying the Seller Asset 		
				}
				else {
//					response.sendRedirect("register.jsp?msg=Invalid User");
				}
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}			
			break;

			
			


		
			
			/* Get a selected Vehicle from database */	
		case "VehiclesPage":														
			
			String vehicleName=request.getParameter("vehicle");
			sess=request.getSession();
			vehicleArrayList=(ArrayList<Vehicle>) sess.getAttribute("vehicleArrayList");
			vehicle = null;
			for(Vehicle tempVehicle:vehicleArrayList){
				if(tempVehicle.getVehicleName().equals(vehicleName)){
					vehicle=tempVehicle;
					break;
				}
			}
			sess.setAttribute("selectedVehicle", vehicle);
			response.sendRedirect("ViewSelectedVehicle.jsp");
			break;
			
			
		/* Serach Assets from database */	
		case "searchAssets":	
			searchAssets=request.getParameter("searchBar");
			System.out.println(searchAssets);
			
			try {
				d1=new DAO();
				a1=d1.searchAssets(searchAssets);	
				if(a1!=null)
				{
					sess.setAttribute("a1", a1);
					response.sendRedirect("Assets.jsp");//jsp	
				}
				else {
//					response.sendRedirect("register.jsp?msg=Invalid User");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
			/* Serach Vehicles from database */	
		case "searchVehicles":	
			String searchVehicles=request.getParameter("searchBar");
			System.out.println(searchVehicles);

			as1 = new Asset();
			as1.setCategory(searchVehicles);
			sess.setAttribute("category", as1);			

			try {
				d1=new DAO();
				vehicleArrayList=d1.searchVehicles(searchVehicles);	
				if(a1!=null)
				{
					sess.setAttribute("vehicleArrayList", vehicleArrayList);
					response.sendRedirect("Vehicles.jsp");//jsp	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		/* Serach Assets Autocomplete*/	
		case "searchAutoComplete":	
			System.out.println("in Serach Assets Autocomplete  Servlet ");
			searchAssets=request.getParameter("searchBar");
			PrintWriter out=response.getWriter();
			try {
				d1=new DAO();
				ArrayList<Asset> a2=d1.searchAssets(searchAssets);	
				ArrayList<String> a3=new ArrayList<String>();	
				for(Asset asset2:a2){
					String str=asset2.getAssetname();
					a3.add(str);
				}
				    
					Gson gson=new Gson();
					out.write(gson.toJson(a3));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			
		case "AssetAddd":	
		{
			String v9 = request.getParameter("radios1");
			String v10 = request.getParameter("radios2");
			System.out.println(v9);
			System.out.println(v10);
			
			if(v9!=null && v9!="real estate"){
				//u1=(User) sess.getAttribute("user");
				str1=request.getParameter("pdate");
				eprice=Double.parseDouble(request.getParameter("purchase_cost"));
				str4=request.getParameter("asset_name");
				str11=request.getParameter("utype");
				str12=request.getParameter("ptype");
					
				str5=request.getParameter("sno");
				str6=request.getParameter("street");
				str7=request.getParameter("city");
				str8=request.getParameter("state");
				str9=request.getParameter("country");
				str10=request.getParameter("zip");
				/*str11 = request.getParameter("optradio");
				System.out.println(str11);*/				
				String str13=str5+", "+str6+", "+str7+", "+str8+", "+str9+", "+str10;
				
				System.out.println(str1+eprice+str4+str5+str6+str7+str8+str9+str10+str11+str12);
				System.out.println("addr= "+str13);
				
				as1 = new Asset();
				as1.setAssetname(str4);			
				as1.setInfo(str13);
				as1.setCategory("Real Estate");
				as1.setEprice(eprice);
				as1.setSname(u1.getName());

				as1.setPdate(str1);
				as1.setPtype(str12);
				as1.setUtype(str11);
				try {
					d1 =new DAO();
					boolean status = d1.AssetAddd(as1);
					if(status)
					{
						sess=request.getSession();
						sess.setAttribute("addAsset", as1);
						response.sendRedirect("UploadAssetImages.jsp");	
					}
					else
					{
						
						response.sendRedirect("AddAsset.jsp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


			}
			
			
			// Add Vehicle to database from seller	
			
			if(v10!=null && v10!="vehicle") {
				try {


				String v1,v2,v4,v5,v6,v8,info,status;
				double v3;
				v1 = request.getParameter("make");
				v2 = request.getParameter("model");
				v3=Double.parseDouble(request.getParameter("price"));

				v4 = request.getParameter("color");
				v5 = request.getParameter("pdate1");
				v6 = request.getParameter("year");
				status = request.getParameter("status");
				v8 = request.getParameter("condition");
				
				info=v2+", "+v5+", "+v6;
			System.out.println("make= "+ v1);
			
			vehicle=new Vehicle();
			
			vehicle.setVehicleName(v1);
			vehicle.setInfo(info);
			vehicle.setCategory("Vehicle");
			vehicle.setEprice(v3);
			vehicle.setSname(u1.getName());
			vehicle.setColor(v4);
			vehicle.setStatus(status);
			vehicle.setCondition(v8);
			vehicle.setPdate1(v5);
			System.out.println(vehicle.getSname());
			
				d1= new DAO();
				boolean statusv=d1.AddVehicle(vehicle);														//Add fun called here for Seller Asset
				if(statusv)
				{
					sess=request.getSession();
					sess.setAttribute("addVehicle", vehicle);
					response.sendRedirect("UploadVehicleImages.jsp");	
					//response.sendRedirect("BargainCntr?page=SABid");				//Then next Display the Asset table to Seller(Cntr goto SelingListLink case)
				}else{
					response.sendRedirect("ÄddVehicle.jsp");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			}			
			break;
		}
	
			
			
		default:
			
			break;
			
		}		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}