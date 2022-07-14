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
		
		
		

		
	public List<Object[]> findVideoByNameUser(String videoname) {
		TypedQuery<Object[]> query = em.createQuery("SELECT o.user.id , o.user.fullname, o.user.email, o.likeDate  "
				+ "FROM Favorite o WHERE o.video.id LIKE :name", Object[].class);
		query.setParameter("name", "%"+videoname+"%");
		return query.getResultList();
		

	}

	
				
		public List<Object[]> findVideoByNameShare(String videoname) {
			TypedQuery<Object[]> query = em.createQuery("SELECT o.user.fullname , o.user.email, o.email, o.shareDate FROM Share o WHERE o.video.id LIKE :name ", Object[].class);
			query.setParameter("name", "%"+videoname+"%");
			return query.getResultList();
			
			

			
		}
	
}


