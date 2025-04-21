package com.eGrocery.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Date;

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

		String insertQuery = "INSERT INTO user (firstname, lastname, email, password, phone) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert student details
			insertStmt.setString(1, registerModel.getFirstName());
			insertStmt.setString(2, registerModel.getLastName());
			insertStmt.setString(3, registerModel.getEmail());
			insertStmt.setString(4, registerModel.getPassword());
			insertStmt.setString(5, registerModel.getPhoneNumber());


			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}
