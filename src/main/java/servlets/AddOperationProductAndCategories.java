package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;
import entitys.Categories;
import entitys.Products;
import factoryProvider.FactoryProvider;

@MultipartConfig
public class AddOperationProductAndCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get parameter hidden field
		// check Which Operation to do..
		String CheckReqOperation = request.getParameter("operation");

		// adding categories here
		if (CheckReqOperation.trim().equals("productOperation")) {
			// add product
			String productTitle = request.getParameter("productTitle");
			String productDescription = request.getParameter("productDescription");
			Part part = request.getPart("productImage");
			int productPrice = Integer.parseInt(request.getParameter("productPrice"));
			int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
			String productQuantity = request.getParameter("productQuantity");
			int productCategoryId = Integer.parseInt(request.getParameter("selectCategoryId"));

			// categoryDao
			CategoryDao cdao = new CategoryDao(new FactoryProvider().getSessionFactory());
			Categories category = cdao.getCategoryById(productCategoryId);

			// products obj
			Products prod = new Products();
			// setting product
			prod.setpTitle(productTitle);
			prod.setpDescription(productDescription);
			prod.setpImage(part.getSubmittedFileName());
			prod.setpPrice(productPrice);
			prod.setpDiscount(productDiscount);
			prod.setpQuantity(productQuantity);
			prod.setCatagories(category);

			// httpsSession
			HttpSession session = request.getSession();

			// validation
			if (productTitle.isEmpty() || productDescription.isEmpty() || part.getSubmittedFileName().isEmpty()
					|| productPrice < 0 || productDiscount < 0 || productQuantity.isEmpty()
					|| productCategoryId < 0) {
				session.setAttribute("message", "Error! : Can't Add Empty Field!");
				response.sendRedirect("AdminUser.jsp");
				return;
			}

			String path = request.getRealPath("image") + File.separator + "product" + File.separator
					+ part.getSubmittedFileName();

			System.out.println(path);

			try {
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				is.close();
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", "Error : Try Again! Can't Find The Product Image!");
			}
			try {
				// create product dao
				ProductDao p_dao = new ProductDao(new FactoryProvider().getSessionFactory());
				p_dao.saveProducts(prod);
				session.setAttribute("message", "Product Added Successfully");
				response.sendRedirect("AdminUser.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("message", "Error! : Something Went Wrong!");
			}

		}

		// adding categories here
		if (CheckReqOperation.trim().contains("categoryOperation")) {
			// add categories

			String catTitle = request.getParameter("categoryTitle");
			String catDesc = request.getParameter("categoryDescription");

			// Create category object dao
			Categories cat = new Categories();
			cat.setTitle(catTitle);
			cat.setDescription(catDesc);

			HttpSession httpSession = request.getSession();

			// Validation
			if (catTitle.isEmpty() || catDesc.isEmpty()) {
				httpSession.setAttribute("message", "Errors : Can't Add Empty Field!");
				response.sendRedirect("AdminUser.jsp");
				return;
			}
			try {
				// Hibernate Configuration
				CategoryDao catdao = new CategoryDao(new FactoryProvider().getSessionFactory());
				int catId = catdao.saveCategories(cat);
				httpSession.setAttribute("message", "Category Added Successfully");
				httpSession.setAttribute("catId", "Category Id" + catId);
				response.sendRedirect("AdminUser.jsp");
				return;
			} catch (Exception e) {
				e.printStackTrace();
				httpSession.setAttribute("message", "Category Not Added : Something Went Wrong!");
				response.sendRedirect("AdminUser.jsp");
				return;
			}

		}

	}

}
