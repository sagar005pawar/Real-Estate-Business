package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.Database;
import model.AdminDAO;
import model.DAO;
import model.ForgetPassword;
import model.ReviewerDAO;
import model.User;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = response.getWriter();
		String page = request.getParameter("page");

		String user, pass, email, city, reviewer, negotiator, proprietor, status, name = null;
		ArrayList<User> arrayList;
		User u1 = null;
		DAO d1;
		ReviewerDAO reviewerDAO;
		AdminDAO adminDAO;
		HttpSession httpSession = null;
		ForgetPassword forgetPassword;

		/* Login Page */
		switch (page) {
		case "LoginPage":// User Login Page Controller
			try {

			user = request.getParameter("name"); // Getting username
			pass = request.getParameter("pass"); // Getting password
			if("admin".equals(user)&&"test".equals(pass)){
				httpSession=request.getSession();
				u1=new User();
				u1.setName("admin");
				httpSession.setAttribute("user", u1);
				pw.print("valid");
			}else if("author".equals(user)&&"test".equals(pass)){
				httpSession=request.getSession();
				u1=new User();
				u1.setName("author");
				httpSession.setAttribute("user", u1);
				pw.print("valid");
			} else {
			u1 = new User();
			u1.setName(user); // Initializing user with those values
			u1.setPassword(pass);
			d1 = new DAO();
			u1 = d1.validate(u1);
			
			if (("valid").equals(u1.getStatus())) { // if details of user matches i.e
											// valid user
				// pw.print("Welcome "+u1.getName()+" to City "+u1.getCity());
				httpSession=request.getSession();
				/*if(!httpSession.isNew()){
					httpSession.invalidate();
				}*/
				httpSession.setAttribute("user", u1);
				pw.print("valid");
				Database db;
					db = new Database();
				try {
					u1 = db.getUser(user);

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				httpSession = request.getSession();
				httpSession.setAttribute("user", u1);

				// response.sendRedirect("Home.jsp");
			} else if (("invalid").equals(u1.getStatus())) { // If user does not exists
				pw.print("invalid");

			} else if (("unauthenticated").equals(u1.getStatus())) { // if user registered
															// but does not
															// authenticated
				pw.print("unauthenticated");

			}
			}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			break;

		/* Register Page */
		case "Register":
			try {

			user = request.getParameter("usname"); // Getting all the details from register Page
			pass = request.getParameter("pass");
			email = request.getParameter("emailId");
			city = request.getParameter("city");
			reviewer = request.getParameter("reviewer");
			proprietor = request.getParameter("proprietor");
			negotiator = request.getParameter("negotiator");
			// String contact=request.getParameter("contact");

			u1 = new User(); // creating object of user class
			u1.setName(user); // Assigning all the details to user
			u1.setPassword(pass);
			u1.setEmail(email);
			u1.setCity(city);
			u1.setNegotiator(negotiator);
			u1.setProprietor(proprietor);
			u1.setReviewer(reviewer);

			d1 = new DAO();

				if (d1.registerUser(u1)) { // If successfully inserted user in table
					/*pw.print("<script>alert('Congratulations!!! you have successfully Registered. Our team will Authenticate you soon')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("UploadProfilePhoto.jsp");
					rd.include(request, response);*/
					httpSession=request.getSession();
					httpSession.setAttribute("registeredUser", u1);
					response.sendRedirect("UploadProfilePhoto.jsp");
				} else { // If user name already exists navigate to register page
					// with error message
					pw.print("<script>alert('UserName already exists. Please use another UserName')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
					rd.include(request, response);
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		/* Loguot User*/
			
			/* Register Page */
		case "EditProfile":
			user = request.getParameter("usname"); // Getting all the details from register Page
			pass = request.getParameter("pass");
			email = request.getParameter("emailId");
			city = request.getParameter("city");
			reviewer = request.getParameter("reviewer");
			proprietor = request.getParameter("proprietor");
			negotiator = request.getParameter("negotiator");
			// String contact=request.getParameter("contact");

			u1 = new User(); // creating object of user class
			u1.setName(user); // Assigning all the details to user
			u1.setPassword(pass);
			u1.setEmail(email);
			u1.setCity(city);
			u1.setNegotiator(negotiator);
			u1.setProprietor(proprietor);
			u1.setReviewer(reviewer);

			d1 = new DAO();

			if (d1.updateUser(u1)) { // If successfully inserted user in table
				//response.sendRedirect("LoginPage.jsp");
				pw.print("<script>alert('Profile Successfully updated')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
				rd.include(request, response);
			} else { // If user name already exists navigate to register page
				// with error message
				pw.print("<script>alert('UserName already exists. Please use another UserName')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
				rd.include(request, response);
			}
			break;
		/* Loguot User*/
		case "Logout":
		{
			httpSession=request.getSession();
			httpSession.invalidate();
			response.sendRedirect("LoginPage.jsp");
			break;
		}
		/* Change Password */
		case "EnterNewPassword":
			email = request.getParameter("email");
			pass = request.getParameter("pass");
			System.out.println(email + " " + pass);
			forgetPassword = new ForgetPassword();
			try {
				if (forgetPassword.changePassword(email, pass)) {
					pw.print("<script>alert('Password changed succsessfully')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
					rd.include(request, response);
				} else {
					pw.print("<script>alert('Please try after some time')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
					rd.include(request, response);
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;

		/* Reviewer Login Controller */
		case "ReviewerLoginPage":
			user = request.getParameter("usname"); // Getting username
			pass = request.getParameter("pass"); // Getting password
			u1 = new User();
			u1.setName(user); // Initializing user with those values
			u1.setPassword(pass);
			reviewerDAO = new ReviewerDAO();
			status = reviewerDAO.validateReviewer(u1);

			if (status.equals("valid")) { // if details of user matches i.e
											// valid user
				// pw.print("Welcome "+u1.getName()+" to City "+u1.getCity());
				response.sendRedirect("ReviewerHomePage.jsp");
			} else if (status.equals("invalid")) { // Credentials does not match
				pw.print("<script>alert('Invalid Credentials')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("ReviewerLoginPage.jsp");
				rd.include(request, response);

			} else if (status.equals("unauthenticated")) { // if user registered
				// but does not
				// authenticated
				pw.print("<script>alert('You are NOT yet authenticated. Please Login after some time')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("ReviewerLoginPage.jsp");
				rd.include(request, response);
			} else if (status.equals("notReviewer")) { // if user is not
														// reviewer
				pw.print("<script>alert('You are not registered as reviewer. Kindly Register')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("ReviewerLoginPage.jsp");
				rd.include(request, response);
			}

			break;

		/* Authenticate User by reviewer Controller */
		case "UnAuthorisedUserList":

			httpSession = request.getSession();
			int i;
			ArrayList<User> a1 = (ArrayList<User>) httpSession.getAttribute("a");
			for (i = 0; i < a1.size(); i++) {
				if (request.getParameter("btn[" + i + "]") != null) {
					break;
				}
			}
			name = a1.get(i).getName();
			reviewerDAO = new ReviewerDAO();
			try {

				if (reviewerDAO.authenticateUser(name)) {
					// pw.print("<script>alert('User Successfully
					// authenticated')</script>");
					// RequestDispatcher
					// rd=request.getRequestDispatcher("UnAuthorisedUserList.jsp");
					/// rd.include(request, response);
					response.sendRedirect("UserController?page=ReviewerUnUthorisedListRefresh");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		/* Get UnAuthorized user List controller */
		case "ReviewerUnUthorisedListRefresh":
			httpSession = request.getSession();
			arrayList = new ArrayList<User>();
			reviewerDAO = new ReviewerDAO();
			try {
				arrayList = reviewerDAO.getUnAuthorisedUsers();

			httpSession.setAttribute("a", arrayList);
			httpSession.setAttribute("size", arrayList.size());
			// response.sendRedirect("UnAuthorisedUserList.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("UnAuthorisedUserList.jsp");
			rd.forward(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			break;

		/* Admin Login Controller */
		case "AdminLoginPage":
			user = request.getParameter("usname");
			pass = request.getParameter("pass");
			if (user.equals("admin") && pass.equals("test")) {
				response.sendRedirect("AdminHomePage.jsp");
			} else { // if user is not authenticated
				pw.print("<script>alert('Invalid Admin Credentials')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("AdminLoginPage.jsp");
				rd.include(request, response);
			}

			break;
		case "AdminHomePage":
			httpSession = request.getSession();
			arrayList = new ArrayList<User>();
			adminDAO = new AdminDAO();

			try {
				arrayList = adminDAO.getUnAuthorisedUsers();
			httpSession.setAttribute("AdminArrayList", arrayList);
			response.sendRedirect("AdminUnAuthorisedUserList.jsp");
			// rd =
			// request.getRequestDispatcher("AdminUnAuthorisedUserList.jsp");
			// rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;
		/* Authenticate User by reviewer Controller */
		case "AdminUnAuthorisedUserList":

			httpSession = request.getSession();
			int j;

			a1 = (ArrayList<User>) httpSession.getAttribute("AdminArrayList");
			for (j = 0; j < a1.size(); j++) {
				if (request.getParameter("btn[" + j + "]") != null) {
					break;
				}
			}
			u1 = a1.get(j);
			adminDAO = new AdminDAO();
			try {
				if (adminDAO.AdminAuthenticateUser(u1)) {
					response.sendRedirect("UserController?page=AdminHomePage");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;

		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
