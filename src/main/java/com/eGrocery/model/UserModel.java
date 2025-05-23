package com.eGrocery.model;

public class UserModel {
	private String firstName;
	private String lastName;
	private String email;
	private String address;
	private String phone;
	private String password;
	private String imageUrl;
	private Long roleId;
	
	public UserModel(String email, String pasword) {
		this.email = email;
		this.password = pasword;
	}
	
	public UserModel(
			String firstName, 
			String lastName, 
			String email,
			String address,
			String password,
			String phone,
			String imageUrl,
			Long roleId
		) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.password = password;
		this.imageUrl = imageUrl;
		this.setRoleId(roleId);
	}
	
	public UserModel (
			String firstName, 
			String lastName, 
			String email,
			String address, 
			String phone,
			String imageUrl,
			Long roleId
		) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.imageUrl = imageUrl;
		this.roleId = roleId;
	}
	
	public UserModel (
			String firstName, 
			String lastName, 
			String email,
			String address, 
			String phone,
			String imageUrl
		) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.imageUrl = imageUrl;
	}
	
//	public long getId() {
//		return id;
//	}
//	
//	public void setId(long id) {
//		this.id = id;
//	}
	
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
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPhoneNumber() {
		return phone;
	}

	public void setPhoneNumber(String phone) {
		this.phone = phone;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String passwrod) {
		this.password = passwrod;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}
}
