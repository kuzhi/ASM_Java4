package asm.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;

import asm.entity.Report;

@NamedStoredProcedureQueries(
		{
			@NamedStoredProcedureQuery(name = "Report.favoriteByYear",
					procedureName = "sp_FavoriteByYear",
					parameters = {@StoredProcedureParameter(name="year",type = Integer.class)},
					resultClasses = {Report.class})
		}
		)


@Entity

public class Report implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	String group;
	Long likes;
	Date newest;
	Date oldest;
	public Report(String group, Long likes, Date newest, Date oldest) {
		this.group = group;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}
	

	
	public Report() {
		// TODO Auto-generated constructor stub
	}


	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	public Date getNewest() {
		return newest;
	}
	public void setNewest(Date newest) {
		this.newest = newest;
	}
	public Date getOldest() {
		return oldest;
	}
	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
	
}