<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// Initialize necessary objects and variables
HttpSession userSession = request.getSession(false);
String email = (String) (userSession != null ? userSession.getAttribute("email") : null);
String firstName = (String) (userSession != null ? userSession.getAttribute("firstName") : null);
String lastName = (String) (userSession != null ? userSession.getAttribute("lastName") : null);
String phone = (String) (userSession != null ? userSession.getAttribute("phone") : null);
String imageUrl = (String) (userSession != null ? userSession.getAttribute("imageUrl") : null);
String address = (String) (userSession != null ? userSession.getAttribute("address") : null);
%>

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
        <img src="${pageContext.request.contextPath}/resources/images/assets/LOGO.png" alt="Profile Illustration" class="side-image" />
      </div>
      <div class="profile-section">
        <h1>EGrocery</h1>
        
        <div class="profile-header">
          <div class="profile-picture">
            <img src="${pageContext.request.contextPath}${imageUrl}" alt="Profile Picture" />
          </div>
          <div class="profile-name">
            <h2>${firstName} ${lastName}</h2>			
            <p class="member-since">Member since: April 15, 2025</p>
          </div>
        </div>

        <div class="profile-details">
          <div class="detail-group">
            <label>Email Address</label>
            <p>${email}</p>
          </div>
          
          <div class="detail-group">
            <label>Mobile Number</label>
            <p>${phone}</p>
          </div>
          
          <div class="detail-group">
            <label>Address</label>
            <p>${address}</p>
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
        <a href="${pageContext.request.contextPath}/update_profile">
          <button class="edit-button">
          	Edit Profile
          </button>
         </a>
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