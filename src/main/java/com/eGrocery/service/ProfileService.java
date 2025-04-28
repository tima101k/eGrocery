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

		// SQL query to get profile information
		String query = "SLECT firstname, lastname, email, phone, image_url from user WHERE email = ?";

		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, requestEmail);
			ResultSet result = stmt.executeQuery();
			UserModel user = null;

			if (result.next()) {
				// Extract data from the result set
				int id = result.getInt("user_id");
				String firstName = result.getString("firstname");
				String lastName = result.getString("lastname");
				String email = result.getString("email");
				String number = result.getString("phone");
				String imageUrl = result.getString("image_url");


				// Create StudentModel instance
				user = new UserModel(id, firstName, lastName, email, "", number, imageUrl);

				// Add the student to the list
			}
			return user;
		} catch (SQLException e) {
			// Log and handle exceptions
			e.printStackTrace();
			return null;
		}
	}
}
