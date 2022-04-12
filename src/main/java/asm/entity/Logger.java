package asm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "Loggers", uniqueConstraints = { 
		@UniqueConstraint(columnNames = { "UserId" }) 
		})

public class Logger {
	@Id	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long Id;

	@ManyToOne
	@JoinColumn(name = "UserId")
	private User user;

	private String Uri;

	@Column(name = "Datelog")
	private Date dateLog = new Date();

	public Logger() {

	}

	public Logger(long id, User user, String uri, Date dateLog) {
		super();
		Id = id;
		this.user = user;
		this.Uri = uri;
		this.dateLog = dateLog;
	}

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUri() {
		return Uri;
	}

	public void setUri(String uri) {
		Uri = uri;
	}

	public Date getDateLog() {
		return dateLog;
	}

	public void setDateLog(Date dateLog) {
		this.dateLog = dateLog;
	}

	

	
}
