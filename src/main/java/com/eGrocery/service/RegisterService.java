package com.eGrocery.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.eGrocery.config.Dbconfig;
import com.eGrocery.model.RegisterModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {
	private Connection dbConn;
	
	public RegisterService() {
		try {
			this.dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	
	/**
	 * Registers a new user in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(RegisterModel registerModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}
		System.out.println("User address " + registerModel.getAddress());
		String insertQuery = "INSERT INTO user (firstname, lastname, email, address, password, phone, image_url, role) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert student details
			insertStmt.setString(1, registerModel.getFirstName());
			insertStmt.setString(2, registerModel.getLastName());
			insertStmt.setString(3, registerModel.getEmail());
			insertStmt.setString(4, registerModel.getAddress());
			insertStmt.setString(5, registerModel.getPassword());
			insertStmt.setString(6, registerModel.getPhoneNumber());
			insertStmt.setString(7, registerModel.getImageUrl());
			insertStmt.setLong(8, registerModel.getRoleId());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	

	public List<RegisterModel> getAllUsers() {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		// SQL query to fetch details
		String query = "SELECT * from user";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			List<RegisterModel> users = new ArrayList<>();

			while (result.next()) {
				// Create and add StudentModel to the list
				users.add(
					new RegisterModel(
						result.getLong("user_id"),
						result.getString("firstname"),
						result.getString("lastname"),
						result.getString("email")
				));
			}
			return users;
		} catch (SQLException e) {
			// Log and handle exceptions related to student query execution
			e.printStackTrace();
			return null;
		}
	}
}
