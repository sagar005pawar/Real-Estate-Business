package db;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnectivity {
	Connection con=null;
	
	//MySQL Database connection 
	public Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");  //loading driver and getting class
			String url="jdbc:mysql://localhost:3306/t5d";    //connection string with database name
			con=DriverManager.getConnection(url, "root", "root");  // connection string, user name and password
			System.out.println("COnnected to DB");	
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return con;
	}
}
