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

public class Database {
	private Connection con = null;

	public Database() throws Exception {
		ConnectionPoolManager ConnectionPoolManager = new ConnectionPoolManager();
		con = ConnectionPoolManager.getConnectionFromPool();
		System.out.println("Connected to DB");
	}

	public User getUser(String name) throws SQLException {
		User u1 = new User();
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where name='" + name + "'");
			if (!rs.next()) {
				u1 = null;
			} else {
				u1.setName(rs.getString(1));
				u1.setPassword(rs.getString(2));
				u1.setEmail(rs.getString(3));
				u1.setCity(rs.getString(4));
				u1.setValid(rs.getBoolean(5));
				u1.setReviewer(rs.getString(6));
				u1.setNegotiator(rs.getString(7));
				u1.setProprietor(rs.getString(8));
				u1.setImage(rs.getString(9));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			con.close();
			System.out.println("Connection closed in get user");
		}
		return u1;
	}

	public boolean insertUser(User u1) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		System.out.println(u1.getName());
		
		if(u1.getImage()!=null){
			try {
				pstmt = con.prepareStatement("update user set image = ? where name = ?");
				pstmt.setString(1, u1.getImage());
				pstmt.setString(2, u1.getName());
				pstmt.executeUpdate();
				return true;				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}finally {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("Connection closed in insert user");
			}
			
		}
		else{
		try {
			pstmt = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, u1.getName());
			pstmt.setString(2, u1.getPassword());
			pstmt.setString(3, u1.getEmail());
			pstmt.setString(4, u1.getCity());
			pstmt.setBoolean(5, false);
			pstmt.setString(6, u1.getReviewer());
			pstmt.setString(7, u1.getNegotiator());
			pstmt.setString(8, u1.getProprietor());
			pstmt.setString(9, u1.getImage());
			pstmt.executeUpdate();
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
			System.out.println("Connection closed in insert user");
		}
		}
	}

	public ArrayList<User> getUnAuthorisedUsersDB() {
		Statement stmt;
		ArrayList<User> arrayList = new ArrayList<User>();
		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("select * from user where isvalid='0';");

			while (rs.next()) {
				User u1 = new User();
				u1.setName(rs.getString(1));
				u1.setPassword(rs.getString(2));
				u1.setEmail(rs.getString(3));
				u1.setCity(rs.getString(4));
				System.out.println(u1.getName());
				arrayList.add(u1);
			}
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

	public boolean authenticateUserDB(String name) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update user set isvalid=? where name=?");

			pstmt.setBoolean(1, true);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
			status = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = false;
		}
		return status;
	}

	public ArrayList<User> getUnAuthorisedOtherUsersDB() {// Get Un-Authorized
															// users other than
															// general users
		Statement stmt;
		ArrayList<User> arrayList = new ArrayList<User>();
		try {
			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(
					"select * from user where reviewer='requested' or negotiator='requested' or proprietor='requested'");

			while (rs.next()) {
				User u1 = new User();
				u1.setName(rs.getString(1));
				u1.setPassword(rs.getString(2));
				u1.setEmail(rs.getString(3));
				u1.setCity(rs.getString(4));
				u1.setValid(rs.getBoolean(5));
				u1.setReviewer(rs.getString(6));
				u1.setNegotiator(rs.getString(7));
				u1.setProprietor(rs.getString(8));

				arrayList.add(u1);

			}
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
			System.out.println("Connection closed get unauthorised other user in insert user");
		}
		return arrayList;
	}

	public boolean AdminAuthenticateUserDB(User u1, String string) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update user set " + string + " = ? where name=?");
			// pstmt.setString(1, string);
			pstmt.setString(1, "authenticated");
			pstmt.setString(2, u1.getName());
			pstmt.executeUpdate();
			status = true;

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
		}
		return status;
	}

	public boolean validateEmail(String to) {
		// TODO Auto-generated method stub
		boolean status = false;
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where email like '" + to + "';");
			if(rs!=null)
				status=true;
			else
				status=false;
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
		}
		return status;
	}

	public boolean changePasswordDB(String email, String pass) {
		PreparedStatement pstmt;
		boolean status = false;
		try {
			pstmt = con.prepareStatement("update user set password = ? where email like '" + email + "';");
			pstmt.setString(1, pass);
			//pstmt.setString(2, pass);
			pstmt.executeUpdate();
			status = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status=false;
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				status=false;
				e.printStackTrace();
			}
		}
		return status;
	}

	public boolean updateUser(User u1) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		System.out.println(u1.getName());
		
		try {
			pstmt = con.prepareStatement("update user set name = ?, password = ?, email = ?, address = ?, isValid = ?, reviewer = ?, negotiator = ?, proprietor = ? where name = ?");
			pstmt.setString(1, u1.getName());
			pstmt.setString(2, u1.getPassword());
			pstmt.setString(3, u1.getEmail());
			pstmt.setString(4, u1.getCity());
			pstmt.setBoolean(5, true);
			pstmt.setString(6, u1.getReviewer());
			pstmt.setString(7, u1.getNegotiator());
			pstmt.setString(8, u1.getProprietor());
			pstmt.setString(9, u1.getName());
			pstmt.executeUpdate();
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
			System.out.println("Connection closed in insert user");
		}
	}

	public boolean uploadAssetImages(Asset asset) {
		PreparedStatement pstmt = null;
		System.out.println(asset.getImage1());
		
		try {
			pstmt = con.prepareStatement("update assets set image1 = ?, image2 = ?, image3 = ?, image4 = ?, image5 = ? where aname = ?");
			pstmt.setString(1, asset.getImage1());
			pstmt.setString(2, asset.getImage2());
			pstmt.setString(3, asset.getImage3());
			pstmt.setString(4, asset.getImage4());
			pstmt.setString(5, asset.getImage5());
			pstmt.setString(6, asset.getAssetname());
			
			pstmt.executeUpdate();
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
			System.out.println("Connection closed in uploadAssetImages user");
		}
	}

	public boolean uploadVehicleImages(Vehicle vehicle) {
		PreparedStatement pstmt = null;
		System.out.println(vehicle.getImage1());
		
		try {
			pstmt = con.prepareStatement("update vehicles set image1 = ?, image2 = ?, image3 = ?, image4 = ?, image5 = ? where name = ?");
			pstmt.setString(1, vehicle.getImage1());
			pstmt.setString(2, vehicle.getImage2());
			pstmt.setString(3, vehicle.getImage3());
			pstmt.setString(4, vehicle.getImage4());
			pstmt.setString(5, vehicle.getImage5());
			pstmt.setString(6, vehicle.getVehicleName());
			
			pstmt.executeUpdate();
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
			System.out.println("Connection closed in uploadAssetImages user");
		}
	}
}
