<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>EGrocery - My Profile</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/profile.css" />
  <link rel="icon" href="favicon.ico" type="image/x-icon">
</head>
<body>
<body>
  <div class="container">
    <div class="profile-card">
      <div class="image-section">
        <img src="/assets/LOGO.png" alt="Profile Illustration" class="side-image" />
      </div>
      <div class="profile-section">
        <h1>EGrocery</h1>
        
        <div class="profile-header">
          <div class="profile-picture">
            <img src="/api/placeholder/120/120" alt="Profile Picture" />
          </div>
          <div class="profile-name">
            <h2>John Doe</h2>
            <p class="member-since">Member since: April 15, 2025</p>
          </div>
        </div>

        <div class="profile-details">
          <div class="detail-group">
            <label>Email Address</label>
            <p>johndoe@example.com</p>
          </div>
          
          <div class="detail-group">
            <label>Mobile Number</label>
            <p>+1 (555) 123-4567</p>
          </div>
          
          <div class="detail-group">
            <label>Delivery Address</label>
            <p>123 Green Street, Apt 4B<br>New York, NY 10001</p>
          </div>
          
          <div class="detail-group">
            <label>Preferred Payment Method</label>
            <p>Credit Card (Visa ending in 4321)</p>
          </div>
        </div>
        
        <div class="profile-stats">
          <div class="stat-item">
            <span class="stat-number">12</span>
            <span class="stat-label">Orders</span>
          </div>
          <div class="stat-item">
            <span class="stat-number">3</span>
            <span class="stat-label">Lists</span>
          </div>
          <div class="stat-item">
            <span class="stat-number">275</span>
            <span class="stat-label">Points</span>
          </div>
        </div>
        
        <div class="action-buttons">
          <button class="edit-button">Edit Profile</button>
          <button class="secondary-button">Order History</button>
        </div>
        
        <div class="navigation-links">
          <a href="index.html">Back to Home</a> | 
          <a href="settings.html">Settings</a> | 
          <a href="logout.html">Sign Out</a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>