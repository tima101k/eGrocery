package com.eGrocery.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.eGrocery.model.ProductModel;
import com.eGrocery.service.ProductService;
import com.eGrocery.utils.ImageUtil;
import com.eGrocery.utils.ValidationUtil;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/products" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ImageUtil imageUtil = new ImageUtil();
	private final ProductService productService = new ProductService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Initialize necessary objects and variables
		HttpSession userSession = request.getSession(false);
		String email = (String) (userSession != null ? userSession.getAttribute("email") : null);
		if(email == null) {
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		} else {			
			request.setAttribute("productList", productService.getAllProducts());
			request.getRequestDispatcher("/WEB-INF/pages/admin/product.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String validationMessage = validateProductForm(request);
			if (validationMessage != null) {
				System.out.println(validationMessage);
				handleError(request, response, validationMessage);
				return;
			}
			ProductModel productModel = extractProductModel(request);
			Boolean isAdded = productService.addProduct(productModel);
			if(isAdded == null) {
				handleError(request, response, "Our server is under maintenance. Please try again later!");
			}else if(isAdded) {
				try {
					if(uploadImage(request))
						request.setAttribute("productList", productService.getAllProducts());
						handleSuccess(request, response, "Your category is successfully created!", "/WEB-INF/pages/admin/product.jsp");
				}catch (IOException | ServletException e){
					handleError(request, response, "An error occurred while uploading the image. Please try again later!");
					e.printStackTrace(); // Log the exception
				};
				
			};
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Something went wrong while adding product");
		}
	}
	
	private String validateProductForm(HttpServletRequest req) throws IOException, ServletException {
		String name = req.getParameter("name");
		String description = req.getParameter("description");;
		String category = req.getParameter("category");
		String price = req.getParameter("price");
		String stockQuantiy = req.getParameter("stockQuantity");
		String sku = req.getParameter("sku");
		String weight = req.getParameter("weight");
		String volume = req.getParameter("volume");
		
		System.out.println("Category: "+ category);
		Part image = req.getPart("productImage");
		String productImage = imageUtil.getImageNameFromPart(image);
		
		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(name))
			return "Product name is required.";
		if (ValidationUtil.isNullOrEmpty(description))
			return "Product description is required.";
		if (ValidationUtil.isNullOrEmpty(category))
			return "Product category is required.";
		if (ValidationUtil.isNullOrEmpty(price))
			return "Product price is required.";
		if (ValidationUtil.isNullOrEmpty(stockQuantiy))
			return "Product stock quantity is required.";
		if (ValidationUtil.isNullOrEmpty(sku))
			return "Product sku is required.";
		if (ValidationUtil.isNullOrEmpty(weight))
			return "Product weight is required.";
		if (ValidationUtil.isNullOrEmpty(volume))
			return "Product volume is required.";
		return null;
	}
	
	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException 
	{
		req.setAttribute("error", message);
		req.setAttribute("name", req.getParameter("name"));
		req.setAttribute("description", req.getParameter("description"));
		req.setAttribute("category", req.getParameter("category"));
		req.setAttribute("price", req.getParameter("price"));
		req.setAttribute("stockQuantiy", req.getParameter("stockQuantiy"));
		req.setAttribute("sku", req.getParameter("sku"));
		req.setAttribute("weight", req.getParameter("weight"));
		req.getRequestDispatcher("/WEB-INF/pages/admin/add_product.jsp").forward(req, resp);
	}
	
	
	private ProductModel extractProductModel(HttpServletRequest req) throws Exception {
		String name = req.getParameter("name");
		String description = req.getParameter("description");;
		Long category = Long.valueOf(req.getParameter("category"));
		Float price = Float.valueOf(req.getParameter("price"));
		int stockQuantity = Integer.valueOf(req.getParameter("stockQuantity"));
		int sku = Integer.valueOf(req.getParameter("sku"));
		Float weight = Float.valueOf(req.getParameter("weight"));
		Float volume = Float.valueOf(req.getParameter("volume"));
		
		Part image = req.getPart("productImage");
		String productImage = imageUtil.getImageNameFromPart(image);
		
		return new ProductModel(name, productImage, description, category, price, stockQuantity, sku, weight, volume);
	}
	
	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}
	
	private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
		Part image = req.getPart("productImage");
		return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "products");
	}

}
