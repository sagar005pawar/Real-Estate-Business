package model;

import java.sql.*;

import db.Database;
import db.DatabaseConnectivity;

public class DAO {
	private Connection con = null;

	public User validate(User u1) {
		//String status = null;
		User u2 = null;
		try {
			Database db = new Database();
			u2 = db.getUser(u1.getName());
			System.out.println(u2.isValid);
			if (!u2.isValid()) {
				u2.setStatus("unauthenticated");
			} else if ((u1.getName().equals(u2.getName())) && (u1.getPassword().equals(u2.getPassword()))) {
				u2.setStatus("valid");
			} else {
				u2.setStatus("invalid");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			u2.setStatus("invalid");
		}

		return u2;
	}

	public boolean registerUser(User u1) throws Exception {
		boolean status = false;
		System.out.println(u1.getName());
		if (u1.getImage() != null) {
			Database db = new Database();
			status = db.insertUser(u1);// insert profile Photo into database
			status = true;
		} else {
			try {

				Database db = new Database();
				User u2 = db.getUser(u1.getName());// check if user already
													// exists or not
				if (u2 == null)// if user does not exists
				{
					Database db2 = new Database();
					if (u1.getReviewer() != null)
						u1.setReviewer("requested");
					if (u1.getNegotiator() != null)
						u1.setNegotiator("requested");
					if (u1.getProprietor() != null)
						u1.setProprietor("requested");
					status = db2.insertUser(u1);// insert user into database
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				status = false;
			}
		}
		return status;

	}

	public User forgetPass(User u1) {
		try {

			Statement stmt;

			stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery("select * from user");

			while (rs.next()) {
				if ((rs.getString(1)).equals(u1.getName()) && rs.getString(4).equals(u1.getCity())
						&& rs.getString(3).equals(u1.getEmail())) {
					String pass = rs.getString(2);
					u1.setPassword(pass);
					return u1;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public String validateNegotiator(User u1) {
		String status = null;
		try {
			Database db = new Database();
			User u2 = db.getUser(u1.getName());
			System.out.println(u2.isValid);
			if (("authenticated".equals(u2.getNegotiator())) && (u1.getName().equals(u2.getName())) && (u1.getPassword().equals(u2.getPassword()))) {
				status = "Negotiator";
			} else {
				status = "invalid";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status = "invalid";
		}

		return status;
	}

	public boolean updateUser(User u1) {
		// TODO Auto-generated method stub
		boolean status = false;
			try {

					Database db2 = new Database();
					if (u1.getReviewer() != null && u1.getReviewer()!="authenticated")
						u1.setReviewer("requested");
					if (u1.getNegotiator() != null && u1.getReviewer()!="authenticated")
						u1.setNegotiator("requested");
					if (u1.getProprietor() != null && u1.getReviewer()!="authenticated")
						u1.setProprietor("requested");
					status = db2.updateUser(u1);// insert user into database
				

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				status = false;
			}
		
		return status;
	}

}
