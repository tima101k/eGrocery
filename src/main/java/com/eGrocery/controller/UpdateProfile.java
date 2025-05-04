package com.eGrocery.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.eGrocery.model.UserModel;
import com.eGrocery.service.ProfileService;
import com.eGrocery.service.UpdateService;
import com.eGrocery.utils.ImageUtil;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/update_profile" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// Instance of ProfileService for handling business logic
	private ProfileService profileService;
	private final ImageUtil imageUtil = new ImageUtil();
	 // Service for updating student information
    private UpdateService updateService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
    	this.profileService = new ProfileService();
    	this.updateService = new UpdateService();
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
		request.setAttribute("lastName", userData.getLastName());
		request.setAttribute("phone", userData.getPhoneNumber());
		request.setAttribute("address", userData.getAddress());
		 request.setAttribute("imageUrl", userData.getImageUrl());
		
		request.getRequestDispatcher("/WEB-INF/pages/update_pofile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");;
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		long roleId = 1746209646;
		
		Part image = request.getPart("profileImage");
		String imagePath = imageUtil.getImageNameFromPart(image);
		request.setAttribute("imageUrl", imagePath);
		
		uploadImage(request);

		UserModel user = new UserModel(firstName, lastName, email, address, phone, imagePath, roleId);
		
		 Boolean result = updateService.updateUserProfile(user);
		    if (result != null && result) {
		    	response.sendRedirect(request.getContextPath() + "/"); // Redirect to index on success
		    } else {
		    	request.getSession().setAttribute("email", email);
		        handleUpdateFailure(request, response, result); // Handle failure
		    }
	}
	
    /**
     * Handles update failures by setting an error message and forwarding the request 
     * back to the update page.
     * 
     * @param req The HttpServletRequest object containing the request data.
     * @param resp The HttpServletResponse object used to return the response.
     * @param loginStatus Indicates the result of the update operation.
     * @throws ServletException If an error occurs during request processing.
     * @throws IOException If an input or output error occurs.
     */
    private void handleUpdateFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
            throws ServletException, IOException {
        // Determine error message based on update result
        String errorMessage;
        if (loginStatus == null) {
            errorMessage = "Our server is under maintenance. Please try again later!";
        } else {
            errorMessage = "Update Failed. Please try again!";
        }
        req.setAttribute("error", errorMessage);
        req.getRequestDispatcher(req.getContextPath() + "/update").forward(req, resp);
    }
    
    private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("profileImage");
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "profile");
	}

}
