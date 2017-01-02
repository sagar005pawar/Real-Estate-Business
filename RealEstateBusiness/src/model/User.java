package model;

public class User {
	String name;
	String password;
	String email;
	String city;
	double contact;
	boolean isValid;
	String reviewer;
	String proprietor;
	String negotiator;
	String role;
	String image;
	String status;
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isValid() {
		return isValid;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public String getProprietor() {
		return proprietor;
	}

	public void setProprietor(String proprietor) {
		this.proprietor = proprietor;
	}

	public String getNegotiator() {
		return negotiator;
	}

	public void setNegotiator(String negotiator) {
		this.negotiator = negotiator;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public double getContact() {
		return contact;
	}
	public void setContact(double contact) {
		this.contact = contact;
	}
	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}
	public String getName() {
		return name;
	}
	

}
