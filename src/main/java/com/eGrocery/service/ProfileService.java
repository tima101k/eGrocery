package com.eGrocery.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eGrocery.config.Dbconfig;
import com.eGrocery.model.UserModel;

public class ProfileService {
private Connection dbConn;
private boolean isConnectionError = false;
	
	public ProfileService() {
		try {
			this.dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError = true;
		}
	} 
	
	public UserModel getProfileInfo(String requestEmail) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}
		System.out.println("Error query 0");
		
		// SQL query to get profile information
		String query = "SELECT firstname, lastname, email, address, phone, image_url from user WHERE email=?";

		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, requestEmail);
			ResultSet result = stmt.executeQuery();
			UserModel user = null;

			if (result.next()) { 
				// Extract data from the result set 
				// long id = result.getLong("user_id"); 
				String firstName = result.getString("firstname");
				String lastName = result.getString("lastname");
				String email = result.getString("email");
				String address = result.getString("address");
				String number = result.getString("phone");
				String imageUrl = result.getString("image_url");
				
				
				// Create StudentModel instance
				user = new UserModel(firstName, lastName, email, address, number, imageUrl);

				// Add the student to the list
				System.out.println("Error query 1");
			}
			System.out.println("Error query 2");
			return user;
		} catch (SQLException e) {
			// Log and handle exceptions
			System.out.println("Error query 3");
			e.printStackTrace();
			return null;
		}
	}
}
