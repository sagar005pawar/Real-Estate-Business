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

import com.oreilly.servlet.MultipartRequest;

import db.Database;
import model.DAO;
import model.User;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	// location to store file uploaded
	//private static final String UPLOAD_DIRECTORY = "ProfilePhoto";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
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
		PrintWriter pw=response.getWriter();
		String filePath = null,fileName,storePath = null;
		HttpSession httpSession=request.getSession();
		User u1=(User) httpSession.getAttribute("registeredUser");
		String UPLOAD_DIRECTORY=u1.getName();
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
        System.out.println("User Path: "+userPath);
        File uploadUserDir = new File(userPath);
        if (!uploadUserDir.exists()) {
        	uploadUserDir.mkdir();
        }
        
        String uploadPath = userPath + File.separator + "ProfilePhoto";
        // creates the directory if it does not exist
        System.out.println("Upload Path: "+uploadPath);
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // parses the request's content to extract file data
            
            List<FileItem> formItems = upload.parseRequest(request);
            System.out.println("List: "+formItems);
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        fileName = new File(item.getName()).getName();
                        storePath = "Users/"+UPLOAD_DIRECTORY + "/ProfilePhoto/" + fileName;//
                        filePath=uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        System.out.println("File Path: "+filePath);
                        // saves the file on disk
                        //Database database=new Database();
                        /*boolean b=database.inserURL(filePath);
                        if(b)
                        	System.out.println("Inserted into images");
                        else
                        	System.out.println("Problem in inserting url into db");*/
                        item.write(storeFile);
                        System.out.println("Upload has been done successfully!");
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("There was an error: " + ex.getMessage());
        }
        // redirects client to message page       
	
   	u1.setImage(storePath);
	System.out.println("File path out: "+u1.getImage());
	DAO d1 = new DAO();

	try {
		if (d1.registerUser(u1)) { // If successfully inserted user in table
			pw.print(
					"<script>alert('Congratulations!!! you have successfully Registered. Our team will Authenticate you soon')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
			rd.include(request, response);
		} else { // If user name already exists navigate to register page
			// with error message
			pw.print("<script>alert('UserName already exists. Please use another UserName')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
}
