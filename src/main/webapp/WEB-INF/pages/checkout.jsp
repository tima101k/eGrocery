<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

</head>
<body>
<!-- Header -->
    <header class="site-header">
      <div class="container header-container">
        <div class="site-logo">
          <a href="index.html">eGrocery</a>
        </div>

        <nav class="main-nav">
          <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="products.html">Products</a></li>
            <li><a href="categories.html">Categories</a></li>
            <li><a href="about.html">About Us</a></li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </nav>

        <div class="user-actions">
          <a href="cart.html" class="cart-icon active">
            <i class="fas fa-shopping-cart"></i>
            <span class="cart-count">3</span>
          </a>
          <a href="login.html" class="btn btn-primary">Login</a>
        </div>

        <div class="mobile-menu-toggle">
          <i class="fas fa-bars"></i>
        </div>
      </div>
    </header>

    <!-- Page Header -->
    <section class="page-header">
      <div class="container">
        <h1>Checkout</h1>
        <div class="breadcrumb">
          <a href="index.html">Home</a> / <a href="cart.html">Cart</a> /
          <span>Checkout</span>
        </div>
      </div>
    </section>

    <!-- Checkout Section -->
    <section class="checkout-section">
      <div class="container">
        <div class="checkout-container">
          <!-- Checkout Form -->
          <div class="checkout-form-container">
            <div class="checkout-form">
              <h2>Shipping Information</h2>

              <div class="form-row">
                <div class="form-group">
                  <label for="first-name">First Name</label>
                  <input type="text" id="first-name" required />
                </div>
                <div class="form-group">
                  <label for="last-name">Last Name</label>
                  <input type="text" id="last-name" required />
                </div>
              </div>

              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" required />
              </div>

              <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" required />
              </div>

              <div class="form-group">
                <label for="address">Street Address</label>
                <input type="text" id="address" required />
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="city">City</label>
                  <input type="text" id="city" required />
                </div>
                <div class="form-group">
                  <label for="state">State/Province</label>
                  <input type="text" id="state" required />
                </div>
              </div>

              <div class="form-row">
                <div class="form-group">
                  <label for="zip">Zip/Postal Code</label>
                  <input type="text" id="zip" required />
                </div>
                <div class="form-group">
                  <label for="country">Country</label>
                  <select id="country" required>
                    <option value="">Select Country</option>
                    <option value="US">United States</option>
                    <option value="CA">Canada</option>
                    <option value="UK">United Kingdom</option>
                    <option value="AU">Australia</option>
                  </select>
                </div>
              </div>

              <div class="form-group checkbox-group">
                <input type="checkbox" id="save-info" />
                <label for="save-info"
                  >Save this information for next time</label
                >
              </div>

              <div class="shipping-methods">
                <h3>Shipping Method</h3>
                <div class="shipping-method">
                  <input type="radio" name="shipping" id="standard" checked />
                  <label for="standard">
                    <div class="method-name">Standard Shipping</div>
                    <div class="method-info">3-5 business days</div>
                    <div class="method-price">$5.99</div>
                  </label>
                </div>
                <div class="shipping-method">
                  <input type="radio" name="shipping" id="express" />
                  <label for="express">
                    <div class="method-name">Express Shipping</div>
                    <div class="method-info">1-2 business days</div>
                    <div class="method-price">$12.99</div>
                  </label>
                </div>
                <div class="shipping-method">
                  <input type="radio" name="shipping" id="next-day" />
                  <label for="next-day">
                    <div class="method-name">Next Day Delivery</div>
                    <div class="method-info">Next business day</div>
                    <div class="method-price">$19.99</div>
                  </label>
                </div>
              </div>

              <div class="form-submit">
                <button type="button" class="btn btn-primary btn-block">
                  Continue to Payment
                </button>
              </div>
            </div>
          </div>

          <!-- Order Summary -->
          <div class="order-summary">
            <h2>Order Summary</h2>

            <div class="order-items">
              <div class="order-item">
                <div class="item-image">
                  <img
                    src="assets/images/products/apple.jpg"
                    alt="Fresh Apples"
                  />
                  <span class="item-quantity">2</span>
                </div>
                <div class="item-details">
                  <h4>Fresh Apples</h4>
                  <p class="item-price">$2.99</p>
                </div>
                <div class="item-total">$5.98</div>
              </div>

              <div class="order-item">
                <div class="item-image">
                  <img
                    src="assets/images/products/milk.jpg"
                    alt="Organic Milk"
                  />
                  <span class="item-quantity">1</span>
                </div>
                <div class="item-details">
                  <h4>Organic Milk</h4>
                  <p class="item-price">$3.49</p>
                </div>
                <div class="item-total">$3.49</div>
              </div>

              <div class="order-item">
                <div class="item-image">
                  <img
                    src="assets/images/products/bread.jpg"
                    alt="Whole Wheat Bread"
                  />
                  <span class="item-quantity">1</span>
                </div>
                <div class="item-details">
                  <h4>Whole Wheat Bread</h4>
                  <p class="item-price">$2.49</p>
                </div>
                <div class="item-total">$2.49</div>
              </div>
            </div>

            <div class="coupon-section">
              <div class="coupon-form">
                <input type="text" placeholder="Promo Code" />
                <button class="btn btn-secondary">Apply</button>
              </div>
            </div>

            <div class="order-totals">
              <div class="summary-row">
                <div class="summary-label">Subtotal</div>
                <div class="summary-value">$11.96</div>
              </div>
              <div class="summary-row">
                <div class="summary-label">Shipping</div>
                <div class="summary-value">$5.99</div>
              </div>
              <div class="summary-row">
                <div class="summary-label">Tax</div>
                <div class="summary-value">$1.08</div>
              </div>
              <div class="summary-row total">
                <div class="summary-label">Total</div>
                <div class="summary-value">$19.03</div>
              </div>
            </div>

            <div class="order-security">
              <div class="security-badge">
                <i class="fas fa-lock"></i>
                <span>Secure Checkout</span>
              </div>
              <div class="payment-icons">
                <i class="fab fa-cc-visa"></i>
                <i class="fab fa-cc-mastercard"></i>
                <i class="fab fa-cc-amex"></i>
                <i class="fab fa-cc-paypal"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Benefits Section -->
    <section class="benefits-section">
      <div class="container">
        <div class="benefits-grid">
          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-truck"></i>
            </div>
            <h3>Free Delivery</h3>
            <p>Free delivery on orders over $50</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-apple-alt"></i>
            </div>
            <h3>Fresh Products</h3>
            <p>Handpicked fresh items every day</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-shield-alt"></i>
            </div>
            <h3>Secure Checkout</h3>
            <p>100% secure payment</p>
          </div>

          <div class="benefit-card">
            <div class="benefit-icon">
              <i class="fas fa-headset"></i>
            </div>
            <h3>24/7 Support</h3>
            <p>Customer support available all day</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="site-footer">
      <div class="container">
        <div class="footer-container">
          <div class="footer-section">
            <h3>eGrocery</h3>
            <p>
              Your one-stop shop for fresh groceries and household essentials
              delivered right to your doorstep.
            </p>
            <div class="social-links">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
              <a href="#"><i class="fab fa-pinterest"></i></a>
            </div>
          </div>

          <div class="footer-section">
            <h3>Quick Links</h3>
            <ul class="footer-links">
              <li><a href="index.html">Home</a></li>
              <li><a href="products.html">Products</a></li>
              <li><a href="categories.html">Categories</a></li>
              <li><a href="about.html">About Us</a></li>
              <li><a href="contact.html">Contact</a></li>
            </ul>
          </div>

          <div class="footer-section">
            <h3>Customer Service</h3>
            <ul class="footer-links">
              <li><a href="faq.html">FAQ</a></li>
              <li><a href="shipping.html">Shipping Policy</a></li>
              <li><a href="returns.html">Returns & Refunds</a></li>
              <li><a href="terms.html">Terms & Conditions</a></li>
              <li><a href="privacy.html">Privacy Policy</a></li>
            </ul>
          </div>

          <div class="footer-section">
            <h3>Contact Us</h3>
            <ul class="contact-info">
              <li>
                <i class="fas fa-map-marker-alt"></i> 123 Grocery St, Food City,
                FC 12345
              </li>
              <li><i class="fas fa-phone"></i> +1 (555) 123-4567</li>
              <li><i class="fas fa-envelope"></i> info@egrocery.com</li>
              <li><i class="fas fa-clock"></i> Mon-Sat: 8:00 AM - 8:00 PM</li>
            </ul>
          </div>
        </div>

        <div class="footer-bottom">
          <p>&copy; 2023 eGrocery. All Rights Reserved.</p>
          <div class="payment-methods">
            <i class="fab fa-cc-visa"></i>
            <i class="fab fa-cc-mastercard"></i>
            <i class="fab fa-cc-amex"></i>
            <i class="fab fa-cc-paypal"></i>
          </div>
        </div>
      </div>
    </footer>

    <!-- Mobile Menu (Hidden by default) -->
    <div class="mobile-menu">
      <div class="mobile-menu-header">
        <div class="site-logo">eGrocery</div>
        <div class="mobile-menu-close">
          <i class="fas fa-times"></i>
        </div>
      </div>
      <nav class="mobile-nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="products.html">Products</a></li>
          <li><a href="categories.html">Categories</a></li>
          <li><a href="about.html">About Us</a></li>
          <li><a href="contact.html">Contact</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="register.html">Register</a></li>
        </ul>
      </nav>
    </div>
</body>
</html>