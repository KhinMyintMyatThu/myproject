package entity;

import java.util.Date;
import javax.xml.bind.annotation.XmlElement; 
import javax.xml.bind.annotation.XmlRootElement; 
@XmlRootElement(name = "user") 

public class User {
	
	int userId;
	String firstName;
	String lastName;
	String email;
	String gender;
	String password;
	Date dateOfBirth;
	Date createdTime;

	public int getUserId() {
		return userId;
	}
	
	

	public String getPassword() {
		return password;
	}


	@XmlElement
	public void setPassword(String password) {
		this.password = password;
	}


	@XmlElement
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	@XmlElement
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	@XmlElement
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	@XmlElement
	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	@XmlElement
	public void setGender(String gender) {
		this.gender = gender;
	}


	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	@XmlElement
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}



	public Date getCreatedTime() {
		return createdTime;
	}


	@XmlElement
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	

}
