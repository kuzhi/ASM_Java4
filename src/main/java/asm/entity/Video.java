package asm.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;



//Tao namequery
/*@NamedQueries({
	@NamedQuery(name = "Video.findByKeyword",
			query = "SELECT DISTINCT o.video FROM Favorite o "
					+ "WHERE o.video.title LIKE :keyword"
			),
	
	@NamedQuery(name = "Video.findByUser",
			query = "SELECT o.video FROM Favorite o "
					+ "WHERE o.user.id =:id"),	
	
	
	@NamedQuery(name = "Video.findInRange",
			query = "SELECT DISTINCT o.video FROM Favorite o "
					+ "WHERE o.likeDate BETWEEN :min AND :max"),
	
	
})
@NamedNativeQueries(
		{
			@NamedNativeQuery(name = "Report.random10",
					query = "SELECT TOP(10) * FROM Videos ORDER BY newid()",
					resultClass = Video.class
					)
		}
		)*/


///
@Entity
@Table(name="VIDEO")
public class Video {
	
	@Id
	@Column(name = "Video_ID")
	 String id;
	
	@Column(name = "Title")
	 String title;
	
	@Column(name = "Poster")
	 String poster;
	
	@Column(name = "Views")
	 int views;

	@Column(name = "Time")
	 int time;
	

	@Column(name = "Active")
	 boolean active;
	
	@Column(name = "Description")
	 String description;
	
	
	@OneToMany(mappedBy = "video")
	List<Favorite> favorite;
	
	@OneToMany(mappedBy = "video")
	List<Share> share;


	
	


	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public List<Favorite> getFavorite() {
		return favorite;
	}



	public void setFavorite(List<Favorite> favorite) {
		this.favorite = favorite;
	}



	public List<Share> getShare() {
		return share;
	}



	public void setShare(List<Share> share) {
		this.share = share;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getPoster() {
		return poster;
	}



	public void setPoster(String poster) {
		this.poster = poster;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public boolean isActive() {
		return active;
	}



	public void setActive(boolean active) {
		this.active = active;
	}



	public int getViews() {
		return views;
	}



	public void setViews(int views) {
		this.views = views;
	}



	public int getTime() {
		return time;
	}



	public void setTime(int time) {
		this.time = time;
	}


	
}
