package model;

import java.sql.*;
import java.util.ArrayList;

import db.Database;

public class ReviewerDAO {
	
	public String validateReviewer(User u1) {
		String status = null;
		try {
			Database db = new Database();
			User u2 = db.getUser(u1.getName());
			if((u1.getName().equals(u2.getName())) && (u1.getPassword().equals(u2.getPassword()))&&u2.getReviewer()==null){
				status = "notReviewer";
			}else if (u2.getReviewer().equals("requested")) {
				status = "unauthenticated";
			} else if ((u1.getName().equals(u2.getName())) && (u1.getPassword().equals(u2.getPassword()))&&(u2.getReviewer().equals("authenticated"))) {
				status = "valid";
			} else {
				status = "invalid";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status="invalid";
		}

		return status;
	}
	
	public ArrayList<User> getUnAuthorisedUsers() throws Exception {
		ArrayList<User> arrayList = new ArrayList<User>();
		Database db = new Database();
		arrayList = db.getUnAuthorisedUsersDB();
		return arrayList;
	}

	public Boolean authenticateUser(String name) throws Exception {
		Database db = new Database();
		boolean status = db.authenticateUserDB(name);

		status = true;
		return status;
	}

	

}
