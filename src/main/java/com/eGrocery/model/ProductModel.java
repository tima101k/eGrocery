package com.eGrocery.model;

public class ProductModel {
	private Long id;
	private String name;
	private String image;
	private String description;
	private String categoryName;
	private Long category;
	private Float price;
	private int stock_quantity;
	private int sku;
	private Float weight;
	private Float volume;
	private CategoryModel categoryInfo;
	
	public ProductModel(
			Long id,
			String name,
			String image,
			String description,
			Long category,
			Float price,
			int stockQuantity,
			int sku,
			Float weight,
			Float volume
	) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.category = category;
		this.stock_quantity = stockQuantity;
		this.price = price;
		this.sku = sku;
		this.weight = weight;
		this.setVolume(volume);
	}
	
	public ProductModel(
			String name,
			String image,
			String description,
			Long category,
			Float price,
			int stockQuantity,
			int sku,
			Float weight,
			Float volume
	) {
		this.name = name;
		this.image = image;
		this.description = description;
		this.category = category;
		this.stock_quantity = stockQuantity;
		this.price = price;
		this.sku = sku;
		this.weight = weight;
		this.volume = volume;
	}
	
	public ProductModel(
			Long id,
			String name,
			String image,
			String description,
			String categoryName,
			Long category,
			Float price,
			int stockQuantity,
			int sku,
			Float weight,
			Float volume
	) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.categoryName = categoryName;
		this.category = category;
		this.stock_quantity = stockQuantity;
		this.price = price;
		this.sku = sku;
		this.weight = weight;
		this.volume = volume;
	}
	
	public ProductModel(
			String name,
			String image,
			String description,
			CategoryModel category,
			Float price,
			int stockQuantity,
			int sku,
			Float weight,
			Float volume
	) {
		this.name = name;
		this.image = image;
		this.description = description;
		this.categoryInfo = category;
		this.stock_quantity = stockQuantity;
		this.price = price;
		this.sku = sku;
		this.weight = weight;
		this.volume = volume;
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
	public int getStockQuantity() {
		return stock_quantity;
	}
	public void setStockQuantity(int stock_quantity) {
		this.stock_quantity = stock_quantity;
	}
	public int getSku() {
		return sku;
	}
	public void setSku(int sku) {
		this.sku = sku;
	}
	public Float getWeight() {
		return weight;
	}
	public void setWeight(Float weight) {
		this.weight = weight;
	}
	public Long getCategory() {
		return category;
	}
	public void setCategory(Long category) {
		this.category = category;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Float getVolume() {
		return volume;
	}

	public void setVolume(Float volume) {
		this.volume = volume;
	}

	public CategoryModel getCategoryInfo() {
		return categoryInfo;
	}

	public void setCategoryInfo(CategoryModel categoryInfo) {
		this.categoryInfo = categoryInfo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
