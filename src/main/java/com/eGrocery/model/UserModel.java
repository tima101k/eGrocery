package com.eGrocery.model;

public class UserModel {
	
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String number;
	private String password;
	private String imageUrl;
	
	public UserModel(String email, String pasword) {
		this.email = email;
		this.password = pasword;
	}
	
	public String getName() {
		return firstName;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}


}
