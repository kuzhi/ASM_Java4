package asm.DAO;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
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
	
		
	public List<Report> thongKeLuotThich(){
		TypedQuery<Report> query = em.createQuery("SELECT new Report(f.video.title, COUNT(f.video), MAX(f.likeDate), MIN(f.likeDate)) FROM Favorite f GROUP BY f.video.title",Report.class);
		return query.getResultList();
		
	}
		
		
		
		public List<Video> thongKeLuotXem(Date fromDate, Date toDate){
			TypedQuery<Video> query = em.createQuery("SELECT o.video FROM Favorite o WHERE f.likeDate BETWEEN :min AND :max",Video.class);
			query.setParameter("min", fromDate);
			query.setParameter("max", toDate);
			List<Video> list = query.getResultList();
			return list;
		}
		
		public List<Object[]> findVideoByName(String name) {
			TypedQuery<Object[]> query = em.createQuery("SELECT o.video.id,o.video.title, COUNT(*) FROM Share o WHERE o.video.title LIKE :name GROUP BY o.video.id,o.video.title", Object[].class);
			query.setParameter("name", "%"+name+"%");
			List<Object[]> list =query.getResultList();
			
			
			return list;
		}
	
}


