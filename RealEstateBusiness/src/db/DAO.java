package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Asset;
import model.User;
import model.Vehicle;

public class DAO {

	private Connection con = null;

	
	//DB connection creating by object of DB-Connectivity & calling the DB get-connection function
	public DAO() throws SQLException {									
		ConnectionPoolManager ConnectionPoolManager = new ConnectionPoolManager();
		con = ConnectionPoolManager.getConnectionFromPool();
		System.out.println("Connected to DB");
	}

	
	public ArrayList<Vehicle> filteredVehicleAssest(String category,String str1,String str2,String str3,String str4,String str5,String str6) throws SQLException {
		
		ArrayList<Vehicle> a1= new ArrayList<Vehicle>();
		try {		
			Statement stmt= con.createStatement();
			if((str1 != null || str2 != null || str3 != null) && (str4 != null || str5 != null || str6 != null)) {				
				ResultSet rs = stmt.executeQuery("SELECT * FROM assets where category='Vehicle' and isvalid = 'Authorized' and bstatus<>'1' and status IN ('"+str1+"','"+str2+"','"+str3+"') and condition1 IN ('"+str4+"','"+str5+"','"+str6+"');");				
				while (rs.next()) {
					Vehicle vehicle=new Vehicle();
					vehicle.setId(rs.getString(1));
					vehicle.setVehicleName(rs.getString(2));
					vehicle.setInfo(rs.getString(3));
					vehicle.setCategory(rs.getString(4));
					vehicle.setEprice((rs.getDouble(5)));
					vehicle.setBprice((rs.getDouble(6)));
					vehicle.setSname(rs.getString(7));
					vehicle.setBname(rs.getString(8));
					vehicle.setNegotiator(rs.getString(9));
					vehicle.setImage1(rs.getString(12));
					vehicle.setImage2(rs.getString(13));
					vehicle.setImage3(rs.getString(14));
					vehicle.setImage4(rs.getString(15));
					vehicle.setImage5(rs.getString(16));				
					a1.add(vehicle);
				}
				rs.close();
			} else {
				ResultSet rs = stmt.executeQuery("SELECT * FROM assets where category='Vehicle' and isvalid = 'authorized' and bstatus<>'1' and (status IN ('"+str1+"','"+str2+"','"+str3+"') or condition1 IN ('"+str4+"','"+str5+"','"+str6+"'));");				
				while (rs.next()) {
					Vehicle vehicle=new Vehicle();
					vehicle.setId(rs.getString(1));
					vehicle.setVehicleName(rs.getString(2));
					vehicle.setInfo(rs.getString(3));
					vehicle.setCategory(rs.getString(4));
					vehicle.setEprice((rs.getDouble(5)));
					vehicle.setBprice((rs.getDouble(6)));
					vehicle.setSname(rs.getString(7));
					vehicle.setBname(rs.getString(8));
					vehicle.setNegotiator(rs.getString(9));
					vehicle.setImage1(rs.getString(12));
					vehicle.setImage2(rs.getString(13));
					vehicle.setImage3(rs.getString(14));
					vehicle.setImage4(rs.getString(15));
					vehicle.setImage5(rs.getString(16));				
					a1.add(vehicle);
				}
				rs.close();
			}			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in filteredVehicleAssest");
		}		
		return a1;
	}

	
	
	
	
	public ArrayList<Asset> BuyerAssestBidings(String id, String u1) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Asset> a1= new ArrayList<Asset>();		
		try {
			Statement stmt= con.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM bids where id='"+id+"' and buyername='"+u1+"' order by bprices desc;");
			System.out.println("B-prices display to Negotiator for Bargaining of that particular Asset ID's:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setBprice((rs.getDouble(2)));
				as1.setBname(rs.getString(3));
				System.out.println(rs.getString(1));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BidingDisplay fun");
		}		
		return a1;
	}
	
	
	
	public ArrayList<Asset> BiderAssestsDispaly(String u1) throws SQLException {
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'authorized' and bstatus<>'1' and id in (select distinct(id) from bids where buyername='"+u1+"');");
			System.out.println("Assets display to buyer these are Authorized Assets:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setIsvalid(rs.getString(10));
				as1.setBstatus(rs.getString(11));				
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				System.out.println("ID= "+rs.getString(1));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly fun");
		}		
		return a1;
	}	

	
	
	
	public String AthonticateBPrice(Asset author) throws SQLException{
		String set = null;
		try {
			Statement stmt = con.createStatement();
			stmt.executeUpdate("UPDATE `t5d`.`assets` SET `bprice`='"+author.getBprice()+"', `buyername`='"+author.getBname()+"', `negotiator`='"+author.getNegotiator()+"',`bstatus`='1' WHERE `id`='"+author.getId()+"' and `bstatus`<>'1';");
			set="AuthorizedBidingPrice";			
			System.out.println("Authorized Biding Price by Authorizer('bstatus=1') ID= " + author.getId());
			stmt.executeUpdate("DELETE FROM `t5d`.`bids` WHERE `id`='" + author.getId() + "';");
			System.out.println("Related bidings Deleted...");
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}	
		return set;
	}		
	
	
	public ArrayList<Asset> getAssetsforAuthorizer() {					
		ArrayList<Asset> arrayList = new ArrayList<Asset>();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM t5d.assets where bstatus='0' and isvalid='Authorized' and buyername<>'-';");
			System.out.println("Get Assets for Authorizer where bstatus='0' ast-ID's:");
			while (rs.next()) {
				Asset as1 = new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice(rs.getDouble(5));
				as1.setBprice(rs.getDouble(6));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));		
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));	
				System.out.println(as1.getId());
				arrayList.add(as1);					
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in getAssetsforAuthorizer fun");
		}
		return arrayList;
	}
	
	
	/*  Add the Asset into the Asset-table request by Seller for selling the asset  */	
	public boolean AssetAddd(Asset as1) throws SQLException {
		try {
			Statement stmt= con.createStatement();
			String query1="INSERT INTO assets (`aname`, `info`, `category`, `eprice`, `bprice`, `sellername`, `buyername`, `negotiator`, `isvalid`, `bstatus`, `pdate`, `ptype`, `utype`) VALUES ('"+as1.getAssetname()+"', '"+as1.getInfo()+"', '"+as1.getCategory()+"', '"+as1.getEprice()+"', '0', '"+as1.getSname()+"', '-', '-', 'Requested','0', '"+as1.getPdate()+"', '"+as1.getPtype()+"', '"+as1.getUtype()+"');";	
			stmt.executeUpdate(query1);
			System.out.println("Asset inserted= "+as1.getAssetname());
			stmt.close();
//			con.close();
			return true;		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in AssestAddd fun ");
		}
	}

	


	
	/*  Add the Asset into the Asset-table request by Seller for selling the asset  */	
	public boolean AssestAdd(Asset as1) throws SQLException {
		try {
			Statement stmt= con.createStatement();
			String query1="INSERT INTO assets (`aname`, `info`, `category`, `eprice`, `bprice`, `sellername`, `buyername`, `negotiator`, `isvalid`, `bstatus`) VALUES ('"+as1.getAssetname()+"', '"+as1.getInfo()+"', '"+as1.getCategory()+"', '"+as1.getEprice()+"', '0', '"+as1.getSname()+"', '-', '-', 'Requested','0');";
		
			stmt.executeUpdate(query1);
			System.out.println("Asset inserted= "+as1.getAssetname());
			stmt.close();
//			con.close();
			return true;		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in AssestAdd fun ");
		}
	}
	
	
	/* B-Prices send by Negotiator to Reviewer & Authorizer for Authority  */
	public void BidingSending(String id, String bname, double bprice,String Ntr) throws SQLException {
		try {
			Statement stmt= con.createStatement();
			String query1="UPDATE assets SET `bprice`='"+bprice+"', `buyername`='"+bname+"', `negotiator`='"+Ntr+"', `bstatus`='0' WHERE `id`='"+id+"' and `bstatus`<>'1';";
			stmt.executeUpdate(query1);
			System.out.println("biding price updateted in 'asset-table' by negotiator & bstatus='0' of id= "+id);

			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("exception");
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BidingSending fun");
		}						
	}

	
	/* Assets display to buyer that are only Authorized Assets   */
	public ArrayList<Asset> BuyerAssetsDispaly() throws SQLException {
		
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'authorized' and category='Real Estate' and bstatus<>'1';");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly");
		}		
		return a1;
	}


	/* Assets display to buyer that are only Authorized Assets   */
	public ArrayList<Asset> filteredAssest(String category,String str1,String str2,String str3,String str4,String str5,String str6) throws SQLException {
		
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			if((str1 != null || str2 != null || str3 != null) && (str4 != null || str5 != null || str6 != null)) {				
				ResultSet rs = stmt.executeQuery("SELECT * FROM assets where category='real estate' and isvalid = 'Authorized' and bstatus<>'1' and ptype IN ('"+str1+"','"+str2+"','"+str3+"') and utype IN ('"+str4+"','"+str5+"','"+str6+"');");				
				while (rs.next()) {
					Asset as1= new Asset();
					as1.setId(rs.getString(1));
					as1.setAssetname(rs.getString(2));
					as1.setInfo(rs.getString(3));
					as1.setCategory(rs.getString(4));
					as1.setEprice((rs.getDouble(5)));
					as1.setBprice((rs.getDouble(6)));
					as1.setSname(rs.getString(7));
					as1.setBname(rs.getString(8));
					as1.setNegotiator(rs.getString(9));
					as1.setImage1(rs.getString(12));
					as1.setImage2(rs.getString(13));
					as1.setImage3(rs.getString(14));
					as1.setImage4(rs.getString(15));
					as1.setImage5(rs.getString(16));
					a1.add(as1);
				}
				rs.close();
			} else {
				ResultSet rs = stmt.executeQuery("SELECT * FROM assets where category='real estate' and isvalid = 'authorized' and bstatus<>'1' and (ptype IN ('"+str1+"','"+str2+"','"+str3+"') or utype IN ('"+str4+"','"+str5+"','"+str6+"'));");				
				while (rs.next()) {
					Asset as1= new Asset();
					as1.setId(rs.getString(1));
					as1.setAssetname(rs.getString(2));
					as1.setInfo(rs.getString(3));
					as1.setCategory(rs.getString(4));
					as1.setEprice((rs.getDouble(5)));
					as1.setBprice((rs.getDouble(6)));
					as1.setSname(rs.getString(7));
					as1.setBname(rs.getString(8));
					as1.setNegotiator(rs.getString(9));
					as1.setImage1(rs.getString(12));
					as1.setImage2(rs.getString(13));
					as1.setImage3(rs.getString(14));
					as1.setImage4(rs.getString(15));
					as1.setImage5(rs.getString(16));
					a1.add(as1);
				}
				rs.close();
			}			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in filteredAssest");
		}		
		return a1;
	}

	
	/* Assets display to buyer these are Authorized Assets   */
	public ArrayList<Asset> BuyerAssestDispaly(String category) throws SQLException {
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'authorized' and category='"+category+"' and bstatus<>'1';");
			System.out.println("Assets display to buyer these are Authorized Assets:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setIsvalid(rs.getString(10));
				as1.setBstatus(rs.getString(11));				
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				System.out.println("ID= "+rs.getString(1));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly fun");
		}		
		return a1;
	}
	
	
	
	
	public ArrayList<Asset> NegotiatorAssestDispaly() throws SQLException {
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'authorized' and bstatus<>'1' and id in (select distinct(id) from bids);");
			System.out.println("Assets display to buyer these are Authorized Assets:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setIsvalid(rs.getString(10));
				as1.setBstatus(rs.getString(11));				
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				System.out.println("ID= "+rs.getString(1));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly fun");
		}		
		return a1;
	}	
	
	/*  B-prices display to Negotiator for Bargaining of that particular Asset   */
	public ArrayList<Asset> BidingDisplay(String id) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Asset> a1= new ArrayList<Asset>();		
		try {
			Statement stmt= con.createStatement();	
			ResultSet rs = stmt.executeQuery("SELECT * FROM bids where id='" + id + "' order by bprices desc;");
			System.out.println("B-prices display to Negotiator for Bargaining of that particular Asset ID's:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setBprice((rs.getDouble(2)));
				as1.setBname(rs.getString(3));
				System.out.println(rs.getString(1));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BidingDisplay fun");
		}		
		return a1;
	}
	
	
	/* B-price add by Buyer for particular asset-id with (id, b-price, buyername) */
	public void Bidingadd(String id, double bprice,String bname) throws SQLException {
		try {			
			Statement stmt= con.createStatement();
			String query1="INSERT INTO bids (`id`, `bprices`, `buyername`) VALUES ('" + id + "', '" + bprice + "', '" + bname + "');";
			stmt.executeUpdate(query1);
			System.out.println("B-price add by Buyer for particular asset-id with (id, b-price, buyername):ID="+id);		
			stmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in Bidingadd fun ");
		}
	}

	/*get UnAuthorised Assets from asset-table to get the Asset is-valid status is 'Requested'*/	
	public ArrayList<Asset> getUnAuthorisedAssets() {
		Statement stmt;
		ArrayList<Asset> arrayList = new ArrayList<Asset>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from assets where isvalid='Requested' and category='Real Estate';");
			System.out.println("Get UnAuthorised Assets from asset-table to get the Asset is-valid status is 'Requested':");
			while (rs.next()) {
				Asset as1 = new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice(rs.getDouble(5));
				as1.setSname(rs.getString(7));
				System.out.println("as-name= "+as1.getAssetname());
				arrayList.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in getUnAuthorisedAssets fun");
		}
		return arrayList;
	}	
	
	
	/*Authorized the Assets by Reviewer then set is-valid='Authorized' that particular Asset-id*/		
	public Boolean authenticateAsset(String id) throws SQLException {
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update assets set isvalid=? where id=?");
			pstmt.setString(1, "Authorized");
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			status = true;
			System.out.println("Authorized the Assets by Reviewer then set is-valid='Authorized' that particular Asset-id="+id);
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
			
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in authenticateAsset fun ");
		}
		return status;
	}

	
	
	/* get UnAuthorised Biding prices from asset table to check biding status is false(zero)  */
	public ArrayList<Asset> getUnAuthorisedBprice() {					
		Statement stmt;
		ArrayList<Asset> arrayList = new ArrayList<Asset>();
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from assets where bstatus='0';");
			System.out.println("get UnAuthorised(bstatus='0') Bprices: ast-ID's:");
			while (rs.next()) {
				Asset as1 = new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice(rs.getDouble(5));
				as1.setBprice(rs.getDouble(6));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));		
				System.out.println(as1.getId());
				arrayList.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in getUnAuthorisedBprice fun");
		}
		return arrayList;
	}
	
	
	/*Authorized the B-price by Reviewer then set B-Status true(1) that particular Asset-id*/
	public Boolean authenticateBprice(String id) throws SQLException {
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update assets set bstatus=? where id=?");					//update B-status true at Asset-table
			pstmt.setBoolean(1, true);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			status = true;
			System.out.println("Authorized the B-price by Reviewer then set B-Status true(1) that particular Asset-id=" + id);
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in authenticateBprice fun");
		}
		return status;
	}

		
	/* find out Highest B-price of that Asset-id with buyername from Bids-table for the Bidder */
	public Asset searchHB(String id) throws SQLException{
		Asset as1 = new Asset();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM bids where bprices=(SELECT max(bprices) FROM bids where id='" + id + "');");
			if (!rs.next()) {
				as1.setBprice(0);
				as1.setBname("-");
			} else {
				as1.setBprice(rs.getDouble(2));
				as1.setBname(rs.getString(3));
			}
			System.out.println("searchHB for="+id);
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in searchHB fun");
		}
		return as1;
	}
	
	
	/* Assets display to Seller by particular seller(user-name) of that related selling Assets */
	public ArrayList<Asset> SellerADispaly(String uname) throws SQLException {
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			String str="0";
			String str1="1";
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where sellername='"+ uname +"';");
			System.out.println("Assets display to Seller by particular seller(user-name) of that related selling Assets:");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setNegotiator(rs.getString(9));
				as1.setIsvalid(rs.getString(10));	
				as1.setBname(rs.getString(8));
				if(str1.equals(rs.getString(11))){
					as1.setBstatus("YES");					
				}else if(str.equals(rs.getString(11))) {
					as1.setBstatus("NOTHING");					
				}else {
					as1.setBstatus("NOTHING");					
				}
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				System.out.println("ID=" + rs.getString(1) +"  bprice= " + as1.getBprice());
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in SellerADispaly fun");
		}		
		return a1;
	}

	
	
	
	/* total columns are Displaying by this function  */
	public ArrayList<Asset> AssestDispaly() throws SQLException {
		
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {		
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets;");
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setIsvalid(rs.getString(10));
				as1.setBstatus(rs.getString(11));
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				a1.add(as1);
			}
			rs.close();
			stmt.close();
			con.close();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in AssestDispaly function");
		}		
		return a1;
	}
	
	
	
	
	
	/*get UnAuthorised Vehicles from vehicles-table'*/
	public ArrayList<Vehicle> getUnAuthorisedVehicles() {
		ArrayList<Vehicle> arrayList = new ArrayList<Vehicle>();
		try {
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'Requested' and category='vehicle' and bstatus<>'1';");

			while (rs.next()) {
				Vehicle vehicle=new Vehicle();
				vehicle.setId(rs.getString(1));
				vehicle.setVehicleName(rs.getString(2));
				vehicle.setInfo(rs.getString(3));
				vehicle.setCategory(rs.getString(4));
				vehicle.setEprice(rs.getDouble(5));
				vehicle.setSname(rs.getString(7));
				
				arrayList.add(vehicle);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in insert user");
		}
		return arrayList;
	}
	
	

	/*Authenticate the Vehicle by Reviewer then set is-valid='Authorized' to that particular Vehicle-id*/	
	public boolean authenticateVehicle(String id) {
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update assets set isvalid=? where id=?");
			pstmt.setString(1, "Authorized");
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			status = true;
			
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = false;
			
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in insert user");
		}
		return status;
	}

	
	public boolean AddVehicle(Vehicle vehicle) {
		try {
			Statement stmt= con.createStatement();

			String query1="INSERT INTO `t5d`.`assets` (`aname`, `info`, `category`, `eprice`, `bprice`, `sellername`, `buyername`, `negotiator`, `isvalid`, `bstatus`, `pdate`, `color`, `status`, `condition1`) VALUES ('"+vehicle.getVehicleName()+"', '"+vehicle.getInfo()+"', '"+vehicle.getCategory()+"', '"+vehicle.getEprice()+"', '0', '"+vehicle.getSname()+"', '-', '-', 'Requested', '0', '"+vehicle.getPdate1()+"', '"+vehicle.getColor()+"', '"+vehicle.getStatus()+"', '"+vehicle.getCondition()+"');";

			stmt.executeUpdate(query1);
			System.out.println("row inserted");

			stmt.close();
			return true;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in insert vehicle");
		}
	}
	
	

	
	public ArrayList<Asset> searchAssets(String searchAssets) {
		ArrayList<Asset> a1= new ArrayList<Asset>();
		try {
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where aname='"+searchAssets+"' and isvalid = 'Authorized' and category='real estate' and bstatus<>'1';");
			
			
			while (rs.next()) {
				Asset as1= new Asset();
				as1.setId(rs.getString(1));
				as1.setAssetname(rs.getString(2));
				as1.setInfo(rs.getString(3));
				as1.setCategory(rs.getString(4));
				as1.setEprice((rs.getDouble(5)));
				as1.setBprice((rs.getDouble(6)));
				as1.setSname(rs.getString(7));
				as1.setBname(rs.getString(8));
				as1.setNegotiator(rs.getString(9));
				as1.setImage1(rs.getString(12));
				as1.setImage2(rs.getString(13));
				as1.setImage3(rs.getString(14));
				as1.setImage4(rs.getString(15));
				as1.setImage5(rs.getString(16));
				System.out.println("Asset name: "+as1.getAssetname());
				a1.add(as1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly");
		}		
		return a1;
	}

	
	public ArrayList<Vehicle> getVehicles(String category) throws SQLException {
		ArrayList<Vehicle> a1= new ArrayList<Vehicle>();

		try {			
			System.out.println(category);
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where isvalid = 'Authorized' and category='vehicle' and bstatus<>'1';");
			System.out.println("Assets display to buyer these are Authorized Assets:");
			while (rs.next()) {
				Vehicle vehicle=new Vehicle();
				vehicle.setId(rs.getString(1));
				vehicle.setVehicleName(rs.getString(2));
				vehicle.setInfo(rs.getString(3));
				vehicle.setCategory(rs.getString(4));
				vehicle.setEprice((rs.getDouble(5)));
				vehicle.setBprice((rs.getDouble(6)));
				vehicle.setSname(rs.getString(7));
				vehicle.setBname(rs.getString(8));
				vehicle.setNegotiator(rs.getString(9));
				vehicle.setImage1(rs.getString(12));
				vehicle.setImage2(rs.getString(13));
				vehicle.setImage3(rs.getString(14));
				vehicle.setImage4(rs.getString(15));
				vehicle.setImage5(rs.getString(16));				
				a1.add(vehicle);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in getVehicles");
		}		
		return a1;
	}


	public ArrayList<Vehicle> searchVehicles(String searchVehicles) {
		ArrayList<Vehicle> a1= new ArrayList<Vehicle>();
		
		try {
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM assets where aname='"+searchVehicles+"' and isvalid = 'Authorized' and category='vehicle' and bstatus<>'1';");
			while (rs.next()) {
				Vehicle vehicle=new Vehicle();
				vehicle.setId(rs.getString(1));
				vehicle.setVehicleName(rs.getString(2));
				vehicle.setInfo(rs.getString(3));
				vehicle.setCategory(rs.getString(4));
				vehicle.setEprice((rs.getDouble(5)));
				vehicle.setBprice((rs.getDouble(6)));
				vehicle.setSname(rs.getString(7));
				vehicle.setBname(rs.getString(8));
				vehicle.setNegotiator(rs.getString(9));
				vehicle.setImage1(rs.getString(12));
				vehicle.setImage2(rs.getString(13));
				vehicle.setImage3(rs.getString(14));
				vehicle.setImage4(rs.getString(15));
				vehicle.setImage5(rs.getString(16));				
				a1.add(vehicle);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Connection closed in BuyerAssestDispaly");
		}		
		return a1;
	}	
}