package asm.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import asm.entity.User;
import asm.entity.Video;



@Entity
@Table(name = "FAVORITE", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"Video_ID","User_ID"})
})
public class Favorite {
	@Id
	//tạo id tự động
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	
	
	 Long id;
	
	
	@ManyToOne 
	@JoinColumn(name="Video_ID")
	 Video video;
	
	@ManyToOne 
	@JoinColumn(name="User_Id")
	
	 User user;
	
	//thay doi dinh dang date sql
	
	@Temporal(TemporalType.DATE)
	 Date likeDate= new Date();
	
	

	public Favorite() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Favorite(Long id, Video video, User user, Date likeDate) {
		this.id = id;
		this.video = video;
		this.user = user;
		this.likeDate = likeDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	
}
