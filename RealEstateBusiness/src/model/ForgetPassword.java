package model;

import java.util.Properties;
//import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
//import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import db.Database;

public class ForgetPassword {
	public boolean send(String to) throws Exception {
		boolean status;
		Database database = new Database();
		if (database.validateEmail(to)) {
			// Enter Your mail id from where you want to send an email
			final String user = "wsuraj2814@gmail.com";
			// Enter password for the respective mail
			final String pass = "suraj@12589";
			final String subject = "T5D: Forget Password Link ";
			final String messsage = "http://localhost:8081/project/EnterNewPassword.jsp?id="+to;

			Properties props = new Properties(); // create object for Properties
													// class
			props.put("mail.smtp.host", "smtp.gmail.com"); // for the host of
															// gmail
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			System.out.println("First step");
			// 1st step) Get the session object

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					System.out.println("2nd step");
					return new PasswordAuthentication(user, pass); // Verify the
																	// user name
																	// and
																	// password
				}
			});
			// 2nd step)compose message
			try {
				// MIME=Multipurpose Internet Mail Exchange
				System.out.println("in try");
				MimeMessage message = new MimeMessage(session); // create object
																// of
																// mimemessage
				message.setFrom(new InternetAddress(user)); // address of sender
															// username of mail
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // Recipient
																							// mail
																							// id
				message.setSubject(subject); // Subject mentioned by the user
				message.setText(messsage); // message given by the user
				System.out.println("in try last before send");
				// 3rd step)send message
				Transport.send(message); // send mimemessage Using class
											// Transport

				System.out.println("Done");
				status = true;

			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}
		} else {
			status = false;
		}
		return status;
	}

	public boolean changePassword(String email, String pass) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(email+" "+pass);
		Database db=new Database();
		if(db.changePasswordDB(email,pass))
		{
			return true;
		}
		else
			return false;
		
		
	}
}
