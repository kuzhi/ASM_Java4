package asm.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
@Table(name="USERS")
public class User {
	@Id
	@Column(name="User_ID")
	private String id;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="Fullname")
	private String fullname;
	
	@Temporal(TemporalType.DATE)
	@Column(name="Birthday")
	private Date birthDay;
	
	@Column(name="Gender")
	private boolean gender;
	
	@Column(name="Admin")
	private boolean admin ;
	
	
	
	@OneToMany(mappedBy = "user")
	List<Favorite> favorites;
	
	



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
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



	public String getFullname() {
		return fullname;
	}



	public void setFullname(String fullname) {
		this.fullname = fullname;
	}



	public Date getBirthDay() {
		return birthDay;
	}



	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}



	public boolean isGender() {
		return gender;
	}



	public void setGender(boolean gender) {
		this.gender = gender;
	}



	public boolean isAdmin() {
		return admin;
	}



	public void setAdmin(boolean admin) {
		this.admin = admin;
	}



	public List<Favorite> getFavorites() {
		return favorites;
	}



	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	

	
	
}
