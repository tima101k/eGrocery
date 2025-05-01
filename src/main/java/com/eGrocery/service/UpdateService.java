package com.eGrocery.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.eGrocery.config.Dbconfig;
import com.eGrocery.model.UserModel;

public class UpdateService {
	private Connection dbConn;
	private boolean isConnectionError = false;
	
	public UpdateService() {
		try {
			this.dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError = true;
		}
	}
	
	/**
	 * Updates student information in the database.
	 * 
	 * @param student The StudentModel object containing the updated student data.
	 * @return Boolean indicating the success of the update operation. Returns null
	 *         if there is a connection error or an exception occurs.
	 */
	public Boolean updateUserProfile(UserModel user) {
		if (isConnectionError) {
			return null;
		}

		String updateSQL = "UPDATE user SET firstname = ?, lastname = ?, email = ?, phone = ?, image_url = ?, address = ? WHERE email = ?";

		try (PreparedStatement preparedStatement = dbConn.prepareStatement(updateSQL)) {
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmail());
			preparedStatement.setString(4, user.getPhoneNumber());
			preparedStatement.setString(5, user.getImageUrl());
			preparedStatement.setString(6, user.getAddress());
			preparedStatement.setString(7, user.getEmail());
			
			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			// Log and handle SQL exceptions
			e.printStackTrace();
			return null;
		}
	}

}
