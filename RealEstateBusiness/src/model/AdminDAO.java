package model;

import java.util.ArrayList;
import db.Database;

public class AdminDAO {

	public ArrayList<User> getUnAuthorisedUsers() throws Exception {
		// TODO Auto-generated method stub
		
		ArrayList<User> arrayList = new ArrayList<User>();
		ArrayList<User> finalArrayList = new ArrayList<User>();
		Database db = new Database();
		arrayList = db.getUnAuthorisedOtherUsersDB();
		//Iterator<String> it=hashMap.keySet().iterator();
		
		/*while(it.hasNext()){
			System.out.println("In while of get unauthenticated user");
			String key=it.next();
			User u1=hashMap.get(key);
			System.out.println(u1.getName());
		}*/
		for(User u1:arrayList){
			if(u1.getReviewer()!=null && u1.getReviewer().equals("requested")){
				User u2=new User();
				u2.setName(u1.getName());
				u2.setPassword(u1.getPassword());
				u2.setEmail(u1.getEmail());
				u2.setCity(u1.getCity());
				u2.setRole("Reviewer");
				finalArrayList.add(u2);
			}
			if(u1.getNegotiator()!=null && u1.getNegotiator().equals("requested")){
				User u2=new User();
				u2.setName(u1.getName());
				u2.setPassword(u1.getPassword());
				u2.setEmail(u1.getEmail());
				u2.setCity(u1.getCity());
				u2.setRole("Negotiator");
				finalArrayList.add(u2);
			}			
			if(u1.getProprietor()!=null && u1.getProprietor().equals("requested")){
				User u2=new User();
				u2.setName(u1.getName());
				u2.setPassword(u1.getPassword());
				u2.setEmail(u1.getEmail());
				u2.setCity(u1.getCity());
				u2.setRole("Proprietor");
				finalArrayList.add(u2);				
			}
			
		}
		/*arrayList.addAll(reviewerArrayList);
		arrayList.addAll(negotiatorArrayList);
		arrayList.addAll(proprietorArrayList);*/
				
		return finalArrayList;
		
	}

	public boolean AdminAuthenticateUser(User u1) throws Exception {
		Database db = new Database();
		boolean status=false;
		if(u1.getRole().equals("Reviewer")){
			status = db.AdminAuthenticateUserDB(u1,"reviewer");
			status = true;
		}
		else if(u1.getRole().equals("Proprietor")){
			status = db.AdminAuthenticateUserDB(u1,"proprietor");
			status = true;
		}
		else if(u1.getRole().equals("Negotiator")){
			status = db.AdminAuthenticateUserDB(u1,"negotiator");
			status = true;
		}

		
		return status;
	}

}
