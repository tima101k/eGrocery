package com.eGrocery.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eGrocery.config.Dbconfig;
import com.eGrocery.model.ProductModel;

public class ProductService {
	
	private Connection dbConn;
	private boolean isConnectionError = false;
	
	public ProductService() {
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
	public Boolean addProduct(ProductModel productModel) {
		if (isConnectionError) {
			System.err.println("Database connection is not available.");
			return null;
		}
		String insertQuery = "INSERT INTO products (name, image, description, category, price, stock_quantity, sku, weight, volume) "
				+ "VALUES (?, ?, ?, ?, ?, ?,?, ?, ?)";
		try {
			PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery);
			// Insert product details
			insertStmt.setString(1, productModel.getName());
			insertStmt.setString(2, productModel.getImage());
			insertStmt.setString(3, productModel.getDescription());
			insertStmt.setLong(4, productModel.getCategory());
			insertStmt.setFloat(5, productModel.getPrice());
			insertStmt.setInt(6, productModel.getStockQuantity());
			insertStmt.setLong(7, productModel.getSku());
			insertStmt.setFloat(8, productModel.getWeight());
			insertStmt.setFloat(9, productModel.getVolume());
			
			return insertStmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	public List<ProductModel> getAllProducts() {
		if (isConnectionError) {
			System.err.println("Database connection is not available.");
			return null;
		}

		// SQL query to fetch details
		String query = "SELECT * from products";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			ResultSet result = stmt.executeQuery();
			List<ProductModel> products = new ArrayList<>();
			while (result.next()) {
				// Create and add StudentModel to the list
				products.add(
					new ProductModel(
						result.getLong("id"),
						result.getString("name"), 
						result.getString("image"),
						result.getString("description"), 
						result.getLong("category"),
						result.getFloat("price"),
						result.getInt("stock_quantity"),
						result.getInt("sku"),
						result.getFloat("weight"),
						result.getFloat("volume")
				));
			}
			return products;
		} catch (SQLException e) {
			// Log and handle exceptions related to student query execution
			e.printStackTrace();
			return null;
		}
	}

}
