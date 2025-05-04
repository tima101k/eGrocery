package com.eGrocery.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.eGrocery.model.UserModel;
import com.eGrocery.service.ProfileService;
import com.eGrocery.utils.ImageUtil;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Instance of ProfileService for handling business logic
	private ProfileService profileService;
	private final ImageUtil imageUtil = new ImageUtil();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {		
    	this.profileService = new ProfileService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession userSession = request.getSession(false);
		String currentUser = (String) (userSession != null ? userSession.getAttribute("email") : null);
		System.out.println("Current login user email: " + currentUser);

		// Retrieve profile information from the ProfileService
		UserModel userData = profileService.getProfileInfo(currentUser);
		request.setAttribute("email", userData.getEmail());
		request.setAttribute("firstName", userData.getFirstName());
		request.setAttribute("imageUrl", userData.getImageUrl());
		request.setAttribute("phone", userData.getPhoneNumber());
		request.setAttribute("address", userData.getAddress());
		String imageUrl = userData.getImageUrl();
		String imagePath = imageUtil.getImagePath(imageUrl);
		request.setAttribute("imageUrl", imagePath);
		request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
