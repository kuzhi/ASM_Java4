package asm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

@Entity
@Table (name = "SHARE" ,uniqueConstraints = {
		@UniqueConstraint(columnNames = {"User_ID","Video_ID"})
})
public class Share {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Share_ID")
	private Long shardeID;
	
	@ManyToOne
	@JoinColumn(name = "User_ID")
	User user;
	
	@ManyToOne
	@JoinColumn(name = "Video_ID")
	Video video;
	
	@Column(name = "Emails")
	private String email;
	
	@Temporal(TemporalType.DATE)
	@Column(name="ShareDate")
	private Date shareDate = new Date();

	
	
	public Share() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Share(Long shardeID, User user, Video video, String email, Date shareDate) {
		super();
		this.shardeID = shardeID;
		this.user = user;
		this.video = video;
		this.email = email;
		this.shareDate = shareDate;
	}

	public Long getShardeID() {
		return shardeID;
	}

	public void setShardeID(Long shardeID) {
		this.shardeID = shardeID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getShareDate() {
		return shareDate;
	}

	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}
	
	
	
}
