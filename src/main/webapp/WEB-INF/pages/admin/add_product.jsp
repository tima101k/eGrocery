<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Admin Dashboard - Add new product</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/global.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/add_product.css" />
</head>
<body>
   <nav class="navbar">
        <div class="container navbar-container">
            <a href="${pageContext.request.contextPath}/admin" class="logo">eGrocery Admin</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/admin/products">Products</a></li>
                <li><a href="orders.html">Orders</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/customers">Customers</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/add_categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/admin">Logout</a></li>
            </ul>
        </div>
    </nav>
    
	<main class="container">
	    <div class="page-header">
	        <h1 class="page-title">Add New Product</h1>
	    </div>
	    
	    <div class="card">
	        <form 
	        	id="add-product-form"
	        	action="${pageContext.request.contextPath}/admin/products" 
		       	method="post"
		       	enctype="multipart/form-data"
	        	>
	            <div class="form-row">
	                <div class="form-col">
	                    <div class="form-group">
	                        <label for="product-name" class="form-label">Product Name</label>
	                        <input type="text" name="name" class="form-control" id="product-name" placeholder="Enter product name" required>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label for="product-category" class="form-label">Category</label>
	                        <select class="form-control" name="category" id="product-category" required>
	                            <option value="">Select a category</option>
	                            <c:forEach var="category" items="${categoryList}" varStatus="status">
	                            	<option value="${category.id}">${category.name}</option>
	                            </c:forEach> 
	                        </select>
	                    </div>
	                    
	                    <div class="form-row">
	                        <div class="form-col">
	                            <div class="form-group">
	                                <label for="product-price" class="form-label">Price ($)</label>
	                                <input type="number" name="price" class="form-control" id="product-price" placeholder="0.00" step="0.01" min="0" required>
	                            </div>
	                        </div>
	                        <div class="form-col">
	                            <div class="form-group">
	                                <label for="product-stock" class="form-label">Stock Quantity</label>
	                                <input type="number" name="stockQuantity" class="form-control" id="product-stock" placeholder="0" min="0" required>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                
	                <div class="form-col">
	                    <div class="form-group">
	                        <label class="form-label">Product Image</label>
	                        <div class="product-image-preview">
	                            <img id="image-preview" src="" alt="Product preview">
	                            <div class="product-image-placeholder">
	                                <div>No image selected</div>
	                                <div>Recommended size: 500x500px</div>
	                            </div>
	                        </div>
	                        <button type="button" class="btn btn-secondary file-upload-btn" id="upload-btn">Choose Image</button>
	                        <input type="file" name="productImage"  class="file-input" id="product-image" accept="image/*">
	                    </div>
	                </div>
	            </div>
	            
	            <div class="form-group">
	                <label for="product-description" class="form-label">Description</label>
	                <textarea class="form-control" name="description"  id="product-description" rows="5" placeholder="Enter product description"></textarea>
	            </div>
	            
	            <div class="form-row">
	                <div class="form-col">
	                    <div class="form-group">
	                        <label for="product-sku" class="form-label">SKU</label>
	                        <input type="text" name="sku"  class="form-control" id="product-sku" placeholder="Enter SKU (optional)">
	                    </div>
	                </div>
	                <div class="form-col">
	                    <div class="form-group">
	                        <label for="product-weight" class="form-label">Weight (kg)</label>
	                        <input type="number" name="weight" class="form-control" id="product-weight" placeholder="0.00" step="0.01" min="0">
	                    </div>
	                </div>
	                <div class="form-col">
	                    <div class="form-group">
	                        <label for="product-weight" class="form-label">Volume (lt)</label>
	                        <input type="number" name="volume" class="form-control" id="product-weight" placeholder="0.00" step="0.01" min="0">
	                    </div>
	                </div>
	            </div>
	            
	            <div class="actions">
	                <button type="button" class="btn btn-secondary" id="cancel-btn">Cancel</button>
	                <button type="submit" class="btn btn-primary">Add Product</button>
	            </div>
	        </form>
	    </div>
	</main>
	<script>
        // Image preview functionality
        const uploadBtn = document.getElementById('upload-btn');
        const fileInput = document.getElementById('product-image');
        const imagePreview = document.getElementById('image-preview');
        const imagePlaceholder = document.querySelector('.product-image-placeholder');
        
        uploadBtn.addEventListener('click', function() {
            fileInput.click();
        });
        
        fileInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    imagePreview.src = e.target.result;
                    imagePreview.style.display = 'block';
                    imagePlaceholder.style.display = 'none';
                };
                reader.readAsDataURL(file);
            }
        });
        
        // Form submission handler
        const form = document.getElementById('add-product-form');
        const cancelBtn = document.getElementById('cancel-btn');
        
        /* form.addEventListener('submit', function(e) {
            e.preventDefault();
            // Here you would handle the form submission, e.g., via AJAX
            alert('Product added successfully!');
            form.reset();
            imagePreview.style.display = 'none';
            imagePlaceholder.style.display = 'flex';
        });
        
        cancelBtn.addEventListener('click', function() {
            // Redirect back to products page
            window.location.href = 'products.html';
        }); */
    </script>
</body>
</html>