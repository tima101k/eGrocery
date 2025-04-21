package com.eGrocery.model;

import java.time.LocalDate;


public class RegisterModel {

	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String phone;
	
	// RegisterModel
	
	public RegisterModel(
			int id,
			String firstName, 
			String lastName, 
			String email,
			String phone, 
			String password
		) {
		System.out.println("3e");
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhoneNumber() {
		return phone;
	}

	public void setPhoneNumber(String phone) {
		this.phone = phone;
	}
	
	public String getPassword() {
		return phone;
	}

	public void setPassword(String passwrod) {
		this.password = passwrod;
	}
}
