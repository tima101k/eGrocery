<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EGrocery - Edit Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/update_profile.css" />
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <img src="/api/placeholder/400/320" alt="Profile Illustration" style="max-width: 100%;">
        </div>
        <div class="content">
            <div class="header">
                <h1>EGrocery</h1>
                <div class="user-info">
                    <div class="avatar">
                        <img src="${pageContext.request.contextPath}${imageUrl}" alt="User Avatar">
                        <div class="change-photo">Change Photo</div>
                        <input type="file" class="file-input" id="avatar-upload">
                    </div>
                    <div class="user-details">
                        <h2>${firstName} ${lastName}</h2>
                        <p>Member since: April 15, 2025</p>
                    </div>
                </div>
            </div>
            
            <form 
            	id="edit-profile-form"
            	action="${pageContext.request.contextPath}/update_profile" 
	        	method="post"
	        	enctype="multipart/form-data"
            >
                <div class="form-group">
                    <label for="display-name">First Name</label>
                    <input type="text" name="firstName" id="display-name" value="${firstName}">
                </div>
                 <div class="form-group">
                    <label for="display-name">Last Name</label>
                    <input type="text" name="lastName" id="display-name" value="${lastName}">
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" name="email" id="email" value="${email}">
                </div>
                
                <div class="form-group">
                    <label for="phone">Mobile Number</label>
                    <input type="tel" name="phone" id="phone" value="${phone}">
                </div>
                <div class="form-group">
	                <label for="profile">Profile Image</label>
	                <input type="file" name="profileImage" id="profileImage" accept="image/*">
	            </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" name="address" placeholder="Address"/>
                </div>
                
                <div class="buttons">
                    <button type="button" class="btn btn-secondary" onclick="window.history.back()">Cancel</button>
                    <button type="submit"  class="btn btn-primary">Save Changes</button>
                </div>
            </form>
            
            <div class="footer">
                <a href="#">Back to Home</a> | <a href="#">Settings</a> | <a href="#">Sign Out</a>
            </div>
        </div>
    </div>