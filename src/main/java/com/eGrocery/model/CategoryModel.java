package com.eGrocery.model;

public class CategoryModel {
	
	private Long id;
	private String name;
	private String description;
	private Boolean is_active;
	private String icon;
	private String color;
	
	public CategoryModel(
			String name, 
			String description, 
			Boolean is_active, 
			String icon, 
			String color
	){
		this.name = name;
		this.description = description;
		this.is_active = is_active;
		this.icon = icon;
		this.color = color;
	}
	
	public CategoryModel(
			Long id,
			String name, 
			String description, 
			Boolean is_active, 
			String icon, 
			String color
	){
		this.id = id;
		this.name = name;
		this.description = description;
		this.is_active = is_active;
		this.icon = icon;
		this.color = color;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getIsActive() {
		return is_active;
	}
	public void setIsActive(Boolean is_active) {
		this.is_active = is_active;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
