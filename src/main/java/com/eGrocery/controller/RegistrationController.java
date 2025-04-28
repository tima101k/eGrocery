package com.eGrocery.controller;

import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.eGrocery.service.RegisterService;
import com.eGrocery.utils.PasswordUtil;
import com.eGrocery.utils.ValidationUtil;
import com.eGrocery.model.RegisterModel;
import com.eGrocery.utils.ImageUtil;


/**
 * Servlet implementation class eGrocery
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ImageUtil imageUtil = new ImageUtil();
	
	private final RegisterService registerService = new RegisterService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Validate and extract user model
			String validationMessage = validateRegistrationForm(request);
			if (validationMessage != null) {
				System.out.println(validationMessage);
				handleError(request, response, validationMessage);
				return;
			}
						
			RegisterModel registerModel = extractUserModel(request);
			Boolean isAdded = registerService.addUser(registerModel);
			if(isAdded == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			}else if(isAdded) {
				try {
					if (uploadImage(request)) {
						handleSuccess(request, response, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");
					} else {
						handleError(request, response, "Could not upload the image. Please try again later!");
					}
				} catch (IOException | ServletException e) {
					handleError(request, response, "An error occurred while uploading the image. Please try again later!");
					e.printStackTrace(); // Log the exception
				}
				handleSuccess(request, response, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");
			};
		} catch (Exception e){
			System.out.println(e);
			System.out.println("Something went wrong here");
		}
		
	}
	
	private RegisterModel extractUserModel(HttpServletRequest req) throws Exception {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String email = req.getParameter("email");
		String number = req.getParameter("phone");
		String password = req.getParameter("password");
		
		Part image = req.getPart("profileImage");
		String imageUrl = imageUtil.getImageNameFromPart(image);
		
		String encPassword = PasswordUtil.encrypt(email, password);
		return new RegisterModel(1, firstName, lastName, email, encPassword, number,imageUrl);
		
	}
	
	
	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}
	
	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException 
	{
		req.setAttribute("error", message);
		req.setAttribute("firstName", req.getParameter("firstName"));
		req.setAttribute("lastName", req.getParameter("lastName"));
		req.setAttribute("username", req.getParameter("username"));
		req.setAttribute("dob", req.getParameter("dob"));
		req.setAttribute("gender", req.getParameter("gender"));
		req.setAttribute("email", req.getParameter("email"));
		req.setAttribute("phone", req.getParameter("phone"));
		req.setAttribute("subject", req.getParameter("subject"));
		req.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(req, resp);
	}
	
	private String validateRegistrationForm(HttpServletRequest req) {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");;
		String email = req.getParameter("email");
		String number = req.getParameter("phone");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("confirmPassword");

		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(firstName))
			return "First name is required.";
		if (ValidationUtil.isNullOrEmpty(lastName))
			return "Last name is required.";
		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";
		if (ValidationUtil.isNullOrEmpty(number))
			return "Phone number is required.";
		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		if (ValidationUtil.isNullOrEmpty(retypePassword))
			return "Please retype the password.";
		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";
		if (!ValidationUtil.isValidPhoneNumber(number))
			return "Phone number must be 10 digits and start with 98.";
//		if (!ValidationUtil.isValidPassword(password))
//			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		if (!ValidationUtil.doPasswordsMatch(password, retypePassword))
			return "Passwords do not match.";
		return null; // All validations passed
	}
	
	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("profileImage");
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "profile");
	}



}
