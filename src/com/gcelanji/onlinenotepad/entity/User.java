package com.gcelanji.onlinenotepad.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="first_name")
	@NotNull(message="first name is required")
	@Size(min=1, message="first name is required")
	private String firstName;
	
	@Column(name="last_name")
	@NotNull(message="last name is required")
	@Size(min=1, message="last name is required")
	private String lastName;
	
	@Column(name="birth_date")
	private Date birthDate;
	
	@Column(name="email")
	@NotNull(message="email is required")
	@Size(min=1, message="email is required")
	private String email;
	
	@Column(name="password")
	@NotNull(message="password is required")
	@Size(min=1, message="password is required")
	private String password;
	
	@OneToMany(fetch=FetchType.EAGER,
			mappedBy="user", 
			cascade= {CascadeType.PERSIST,
					CascadeType.DETACH,
					CascadeType.REFRESH,
					CascadeType.REMOVE})
	private List<Note> notes;

	public User() {
		
	}
	
	
	
	public User(int id,
			@NotNull(message = "first name is required") @Size(min = 1, message = "first name is required") String firstName,
			@NotNull(message = "last name is required") @Size(min = 1, message = "last name is required") String lastName,
			Date birthDate,
			@NotNull(message = "email is required") @Size(min = 1, message = "email is required") String email,
			@NotNull(message = "password is required") @Size(min = 1, message = "password is required") String password,
			List<Note> notes) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDate = birthDate;
		this.email = email;
		this.password = password;
		this.notes = notes;
	}



	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Note> getNotes() {
		return notes;
	}

	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDate=" + birthDate
				+ ", email=" + email + ", password=" + password + "]";
	}
	
	public void add(Note tempNote) {
		if(tempNote == null) {
			notes = new ArrayList<>();
		}
		
		notes.add(tempNote);
		
		tempNote.setUser(this);
	}
}
