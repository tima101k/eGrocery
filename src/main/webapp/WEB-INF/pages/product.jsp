<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css" />
</head>
<body>
<nav class="navbar">
        <div class="container navbar-container">
            <a href="index.html" class="logo">eGrocery</a>
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/categories">Categories</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Products</a></li>
            	<li><a href=" ${pageContext.request.contextPath}/cart"">Cart</a></li>
            	<c:if test="${empty sessionScope.email}">
	                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
	                <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.email}">
	            	<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
	            	<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
	        	</c:if>
            </ul>
        </div>
    </nav>

<div class="product-container">
   <div class="product-image">
       <div class="main-image">
           <img id="mainImage" src="https://img.freepik.com/free-photo/eco-bag-with-different-fruits-vegetables-shopping-supermarket_169016-5034.jpg?t=st=1746153176~exp=1746156776~hmac=e24fd922d970f5aa947b6a37c0277d8b161eb611c5d3ffc69b04a12c8223bae6&w=2000" alt="Organic Bananas - Main View">
       </div>
       <div class="thumbnail-gallery">
           <a href="#img1" class="thumbnail-item active">
               <img src="https://img.freepik.com/free-photo/eco-bag-with-different-fruits-vegetables-shopping-supermarket_169016-5034.jpg?t=st=1746153176~exp=1746156776~hmac=e24fd922d970f5aa947b6a37c0277d8b161eb611c5d3ffc69b04a12c8223bae6&w=2000" alt="Organic Bananas - Main View">
           </a>
           <a href="#img2" class="thumbnail-item">
               <img src="https://img.freepik.com/free-photo/eco-bag-with-different-fruits-vegetables-shopping-supermarket_169016-5034.jpg?t=st=1746153176~exp=1746156776~hmac=e24fd922d970f5aa947b6a37c0277d8b161eb611c5d3ffc69b04a12c8223bae6&w=2000" alt="Organic Bananas - Side View">
           </a>
           <a href="#img3" class="thumbnail-item">
               <img src="https://img.freepik.com/free-photo/eco-bag-with-different-fruits-vegetables-shopping-supermarket_169016-5034.jpg?t=st=1746153176~exp=1746156776~hmac=e24fd922d970f5aa947b6a37c0277d8b161eb611c5d3ffc69b04a12c8223bae6&w=2000" alt="Organic Bananas - Close-up">
           </a>
           <a href="#img4" class="thumbnail-item">
               <img src="https://img.freepik.com/free-photo/eco-bag-with-different-fruits-vegetables-shopping-supermarket_169016-5034.jpg?t=st=1746153176~exp=1746156776~hmac=e24fd922d970f5aa947b6a37c0277d8b161eb611c5d3ffc69b04a12c8223bae6&w=2000" alt="Organic Bananas - Packaging">
           </a>
       </div>
       
       <!-- Hidden anchor points for image switching -->
       <span id="img1"></span>
       <span id="img2"></span>
       <span id="img3"></span>
       <span id="img4"></span>
   </div>
        <div class="product-details">
            <h1 class="product-title">Organic Bananas</h1>
            <div class="product-price">$11.00 / bunch</div>
            
            <div class="product-tags">
                <span class="tag">Organic</span>
                <span class="tag">Fresh</span>
                <span class="tag">Fruits & Vegetables</span>
            </div>
            
            <div class="product-description">
                <p>Premium organic bananas sourced from certified organic farms. Each bunch contains 5-7 bananas that are perfectly ripened and ready to eat. Rich in potassium and essential nutrients, these bananas are ethically sourced and sustainably grown without synthetic pesticides or fertilizers.</p>
            </div>
            
            <div class="product-specs">
                <h3 class="specs-title">Product Specifications</h3>
                <ul class="specs-list">
                    <li>
                        <span>Origin</span>
                        <span>Ecuador</span>
                    </li>
                    <li>
                        <span>Weight</span>
                        <span>Approximately 2 lbs per bunch</span>
                    </li>
                    <li>
                        <span>Type</span>
                        <span>Cavendish</span>
                    </li>
                    <li>
                        <span>Storage</span>
                        <span>5-7 days at room temperature</span>
                    </li>
                    <li>
                        <span>Certification</span>
                        <span>USDA Organic</span>
                    </li>
                </ul>
            </div>
            
            <div class="purchase-section">
                <div class="purchase-options">
                    <div class="quantity-container">
                        <label class="quantity-label" for="quantity">Quantity</label>
                        <div class="quantity-selector">
                            <input type="number" id="quantity" name="quantity" value="1" min="1">
                        </div>
                    </div>
                    
                    <div class="delivery-options">
                        <h4 class="delivery-title">Delivery Options</h4>
                        <div class="delivery-choice">
                            <input type="radio" id="delivery-standard" name="delivery" value="standard" checked>
                            <label for="delivery-standard">
                                <div class="option-name">Standard Delivery</div>
                                <div class="option-detail">Delivery within 2-3 days</div>
                            </label>
                        </div>
                        <div class="delivery-choice">
                            <input type="radio" id="delivery-express" name="delivery" value="express">
                            <label for="delivery-express">
                                <div class="option-name">Express Delivery</div>
                                <div class="option-detail">Same day delivery (order before 2pm)</div>
                            </label>
                        </div>
                    </div>
                </div>
                
                <div class="cart-actions">
                    <form class="add-to-cart-form" action="/cart/add" method="post">
                        <input type="hidden" name="product_id" value="123">
                        <button type="submit" class="add-to-cart-btn">Add to Cart</button>
                    </form>
                    <a href="#" class="wishlist-btn">Add to Wishlist</a>
                </div>
                
                <div class="inventory-status in-stock">
                    <span class="status-icon">✓</span> In Stock (27 units available)
                </div>
            </div>
            
            <div class="nutrition-section">
                <h3 class="section-title">Nutrition Information</h3>
                <p>Values per 100g serving</p>
                <table class="nutrition-table">
                    <tr>
                        <th>Calories</th>
                        <td>89 kcal</td>
                    </tr>
                    <tr>
                        <th>Carbohydrates</th>
                        <td>22.8 g</td>
                    </tr>
                    <tr>
                        <th>Fiber</th>
                        <td>2.6 g</td>
                    </tr>
                    <tr>
                        <th>Protein</th>
                        <td>1.1 g</td>
                    </tr>
                    <tr>
                        <th>Potassium</th>
                        <td>358 mg</td>
                    </tr>
                    <tr>
                        <th>Vitamin B6</th>
                        <td>0.4 mg</td>
                    </tr>
                    <tr>
                        <th>Vitamin C</th>
                        <td>8.7 mg</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    
    <div class="review-container">
        <div class="review-header">
            <h2 class="section-title">Customer Reviews</h2>
            <div class="review-summary">
                <div class="rating">
                    <span class="rating-score">4.8</span>
                    <div class="stars">
                        <span class="star filled">★</span>
                        <span class="star filled">★</span>
                        <span class="star filled">★</span>
                        <span class="star filled">★</span>
                        <span class="star half-filled">★</span>
                    </div>
                    <span class="rating-count">24 reviews</span>
                </div>
            </div>
        </div>
        
        <div class="review-list">
            <div class="review-item">
                <div class="review-meta">
                    <div class="reviewer-name">Sarah T.</div>
                    <div class="review-date">April 18, 2025</div>
                </div>
                <div class="review-rating">
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                </div>
                <div class="review-content">
                    <p>These bananas are consistently excellent. Always arrive with the perfect ripeness - not too green and not overripe. The organic quality is noticeably better than standard grocery store options.</p>
                </div>
            </div>
            
            <div class="review-item">
                <div class="review-meta">
                    <div class="reviewer-name">Michael P.</div>
                    <div class="review-date">April 12, 2025</div>
                </div>
                <div class="review-rating">
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star">★</span>
                </div>
                <div class="review-content">
                    <p>Good quality organic bananas. I appreciate that they're ethically sourced. They could be a bit larger for the price, but the taste is excellent.</p>
                </div>
            </div>
            
            <div class="review-item">
                <div class="review-meta">
                    <div class="reviewer-name">Emily K.</div>
                    <div class="review-date">April 5, 2025</div>
                </div>
                <div class="review-rating">
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                    <span class="star filled">★</span>
                </div>
                <div class="review-content">
                    <p>These bananas are a staple in our household. My kids love them, and I love that they're organic. They keep well and have a great flavor. Will continue to purchase!</p>
                </div>
            </div>
        </div>
        
        <div class="review-form-container">
            <h3 class="form-title">Write a Review</h3>
            <form class="review-form">
                <div class="form-group">
                    <label for="reviewer-name">Name</label>
                    <input type="text" id="reviewer-name" name="reviewer-name" required>
                </div>
                
                <div class="form-group">
                    <label for="reviewer-email">Email</label>
                    <input type="email" id="reviewer-email" name="reviewer-email" required>
                </div>
                
                <div class="form-group">
                    <label>Rating</label>
                    <div class="rating-select">
                        <input type="radio" id="star5" name="rating" value="5" required>
                        <label for="star5">5 stars</label>
                        
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4">4 stars</label>
                        
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3">3 stars</label>
                        
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2">2 stars</label>
                        
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1">1 star</label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="review-text">Review</label>
                    <textarea id="review-text" name="review-text" rows="5" required></textarea>
                </div>
                
                <button type="submit" class="submit-review-btn">Submit Review</button>
            </form>
        </div>
    </div>
</body>
</html>