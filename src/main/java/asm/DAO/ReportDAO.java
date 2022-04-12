package asm.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import asm.entity.Report;
import asm.entity.Video;
import asm.jpa.jpaUtils;





public class reportDAO {
	private EntityManager em = jpaUtils.getEntityManger();

	@Override
	protected void finalize() throws Throwable{
		em.close();
	
	}
	
	public List<Report> countLike(){
		
		String jpql = "SELECT new Report(o.video.title, count(o), max(o.likeDate), min(o.likeDate)) FROM Favorite o GROUP BY o.video.title";
				
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
		List<Report> list = query.getResultList();
		
		return list;
	}
	
	
	public List<Video> favByYear(int year2){
		//Name trong name report namedstoredpricedure
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.favoriteByYear");

		query.setParameter("year", year2);
		List<Video> list = query.getResultList();
		
		return list;
	}
	

	
	public List<Integer> selectYear(){
		String jpql = "SELECT YEAR(o.likeDate) FROM Favorite o GROUP BY YEAR(o.likeDate)";
		
		TypedQuery<Integer> query = em.createQuery(jpql, Integer.class);
		
		List<Integer> list = query.getResultList();
		
		return list;
	}
}
