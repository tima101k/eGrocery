package com.eGrocery.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.eGrocery.model.CategoryModel;
import com.eGrocery.model.UserModel;
import com.eGrocery.service.CategoryService;
import com.eGrocery.utils.ImageUtil;
import com.eGrocery.utils.ValidationUtil;

/**
 * Servlet implementation class AdminAddCategoriesController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/add_categories" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminAddCategoriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ImageUtil imageUtil = new ImageUtil();
	private final CategoryService categoryService = new CategoryService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddCategoriesController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("categoryList", categoryService.getAllCategories());
		request.getRequestDispatcher("/WEB-INF/pages/admin/add_categories.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String validationMessage = validateCateogryForm(request);
			if (validationMessage != null) {
				System.out.println(validationMessage);
				handleError(request, response, validationMessage);
				return;
			}
			CategoryModel categoryModel = extractCateogryModel(request);
			Boolean isAdded = categoryService.addCategory(categoryModel);
			if(isAdded == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			}else if(isAdded) {
				handleSuccess(request, response, "Your category is successfully created!", "/WEB-INF/pages/admin/add_categories.jsp");
			};
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Something went wrong while adding category");
		}
	}
	
	private String validateCateogryForm(HttpServletRequest req) throws IOException, ServletException {
		String name = req.getParameter("name");
		String description = req.getParameter("description");;
		String is_active = req.getParameter("is_active");
		String color = req.getParameter("color");
		
		Part image = req.getPart("icon");
		String icon = imageUtil.getImageNameFromPart(image);
		
		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(name))
			return "Category name is required.";
		if (ValidationUtil.isNullOrEmpty(description))
			return "Category description is required.";
		if (ValidationUtil.isNullOrEmpty(is_active))
			return "Cateogry status is required.";
		if (ValidationUtil.isNullOrEmpty(color))
			return "Category color is required.";
		if (ValidationUtil.isNullOrEmpty(icon))
			return "Category icon is required.";
		return null;
	}
	
	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException 
	{
		req.setAttribute("error", message);
		req.setAttribute("name", req.getParameter("name"));
		req.setAttribute("description", req.getParameter("description"));
		req.setAttribute("color", req.getParameter("color"));
		req.setAttribute("icon", req.getParameter("icon"));
		req.getRequestDispatcher("/WEB-INF/pages/admin/add_cateogries.jsp").forward(req, resp);
	}
	
	private CategoryModel extractCateogryModel(HttpServletRequest req) throws Exception {
		String name = req.getParameter("name");
		String description = req.getParameter("description");;
		Boolean is_active = Boolean.valueOf(req.getParameter("is_active"));
		String color = req.getParameter("color");
		
		Part image = req.getPart("icon");
		String icon = imageUtil.getImageNameFromPart(image);
		
		return new CategoryModel(name, description, is_active, icon, color);
		
	}
	
	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}
	
	

}
