package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import db.Database;
import model.Asset;
import model.User;
import model.Vehicle;

/**
 * Servlet implementation class UploadVehicleImages
 */
public class UploadVehicleImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 1; // 1MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 1; // 1MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 1; // 1MB

	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadVehicleImages() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=null;
		try {
			InputStream in=new FileInputStream("C:\\New folder\\Practice Section\\Advanced Java\\T5D v1.10\\t5d.properties");
			Properties properties=new Properties();
			properties.load(in);
			path = properties.getProperty("userPath");			
			//System.out.println(properties.getProperty("name"));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter pw = response.getWriter();
		String imageId=request.getParameter("image");
		String filePath = null, fileName, storePath = null;
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("user");
		Vehicle vehicle=(Vehicle) httpSession.getAttribute("addVehicle");		
		vehicle.setSname(user.getName());		
		String UPLOAD_DIRECTORY = user.getName();
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		// configures upload settings
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// sets memory threshold - beyond which files are stored in disk
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// sets temporary location to store files
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);

		// sets maximum size of upload file
		upload.setFileSizeMax(MAX_FILE_SIZE);

		// sets maximum size of request (include file + form data)
		upload.setSizeMax(MAX_REQUEST_SIZE);

		// constructs the directory path to store upload file
		// this path is relative to application's directory

		String userPath = path + File.separator + UPLOAD_DIRECTORY;
		// creates the directory if it does not exist
		System.out.println("User Path: " + userPath);
		File uploadUserDir = new File(userPath);
		if (!uploadUserDir.exists()) {
			uploadUserDir.mkdir();
		}

		String vehiclePath = userPath + File.separator + "VehicleImages";
		// creates the directory if it does not exist
		System.out.println("Upload Path: " + vehiclePath);
		File uploadVehicleDir = new File(vehiclePath);
		if (!uploadVehicleDir.exists()) {
			uploadVehicleDir.mkdir();
		}
		
		String uploadPath = vehiclePath + File.separator + vehicle.getVehicleName();
		// creates the directory if it does not exist
		System.out.println("Upload Path: " + uploadPath);
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			// parses the request's content to extract file data

			List<FileItem> formItems = upload.parseRequest(request);
			System.out.println("List: " + formItems);
			if (formItems != null && formItems.size() > 0) {
				// iterates over form's fields
				int i=1;
				for (FileItem item : formItems) {
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						fileName = new File(item.getName()).getName();
						storePath = "Users/" + UPLOAD_DIRECTORY + "/VehicleImages/" + vehicle.getVehicleName() +"/"+fileName;
						System.out.println("Store Pth: "+storePath);
						filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						System.out.println("File Path: " + filePath);					
						item.write(storeFile);
						System.out.println("Upload has been done successfully!");
					}
				}
			}
		} catch (Exception ex) {
			System.out.println("There was an error: " + ex.getMessage());
		}
		
		System.out.println("File path out: " + vehicle.getImage1());
		
		// redirects client to message page
		if("1".equals(imageId)){
			vehicle.setImage1(storePath);
			httpSession.setAttribute("addVehicle", vehicle);
			response.sendRedirect("UploadVehicleImages.jsp");
		}
		if("2".equals(imageId)){
			vehicle.setImage2(storePath);
			httpSession.setAttribute("addVehicle", vehicle);
			response.sendRedirect("UploadVehicleImages.jsp");
		}
		if("3".equals(imageId)){
			vehicle.setImage3(storePath);
			httpSession.setAttribute("addVehicle", vehicle);
			response.sendRedirect("UploadVehicleImages.jsp");
		}
		if("4".equals(imageId)){
			vehicle.setImage4(storePath);
			httpSession.setAttribute("addVehicle", vehicle);
			response.sendRedirect("UploadVehicleImages.jsp");
		}
		if("5".equals(imageId)){
			vehicle.setImage5(storePath);
			httpSession.setAttribute("addVehicle", vehicle);
			response.sendRedirect("UploadVehicleImages.jsp");
		}
		
		if("submit".equals(imageId)){
		Database database;
		try {
			database = new Database();
	
		if (database.uploadVehicleImages(vehicle)) { // If successfully inserted user in table
			pw.print(
					"<script>alert('Congratulations!!! you have successfully uploaded Vehicle. Our team will Authenticate it soon')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
			rd.include(request, response);
		} else { // If user name already exists navigate to register page
			// with error message
			pw.print("<script>alert('There is some problem while uploading. Please try again')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
			rd.include(request, response);
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}

	}

}
