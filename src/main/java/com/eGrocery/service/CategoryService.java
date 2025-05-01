package com.eGrocery.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eGrocery.config.Dbconfig;
import com.eGrocery.model.CategoryModel;

public class CategoryService {
	private Connection dbConn;
	private boolean isConnectionError = false;
	
	public CategoryService() {
		try {
			this.dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError = true;
		}
	}
	
	/**
	 * Registers a new user in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addCategory(CategoryModel categoryModel) {
		if (isConnectionError) {
			System.err.println("Database connection is not available.");
			return null;
		}
		String insertQuery = "INSERT INTO categories (name, description, is_active, icon, color) "
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert category details
			insertStmt.setString(1, categoryModel.getName());
			insertStmt.setString(2, categoryModel.getDescription());
			insertStmt.setBoolean(3, categoryModel.getIsActive());
			insertStmt.setString(4, categoryModel.getIcon());
			insertStmt.setString(5, categoryModel.getColor());

			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	public List<CategoryModel> getAllCategories() {
		if (isConnectionError) {
			System.err.println("Database connection is not available.");
			return null;
		}

		// SQL query to fetch details
		String query = "SELECT * from categories";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			List<CategoryModel> categories = new ArrayList<>();

			while (result.next()) {
				// Create and add StudentModel to the list
				categories.add(
					new CategoryModel(
						result.getLong("id"),
						result.getString("name"), 
						result.getString("description"),
						result.getBoolean("is_active"), 
						result.getString("icon"),
						result.getString("color")
				));
			}
			return categories;
		} catch (SQLException e) {
			// Log and handle exceptions related to student query execution
			e.printStackTrace();
			return null;
		}
	}
}
