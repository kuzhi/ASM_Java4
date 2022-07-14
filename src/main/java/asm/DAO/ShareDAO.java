package asm.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import asm.entity.Favorite;
import asm.entity.Share;
import asm.entity.User;
import asm.entity.Video;

public class ShareDAO extends AbstractEntityDAO<Share>{

	public ShareDAO() {
		// TODO Auto-generated constructor stub
		super(Share.class);
	}
	
	
	
	public Share remove(String idUser, String idVideo) {
		// TODO Auto-generated method stub
		emIsopen();

		Share entity = null;
		em.getTransaction().begin();
		try {
			TypedQuery<Share> query = em.createQuery("FROM Share where user.id = :idUser AND video.id = :idVideo", Share.class);
			query.setParameter("idUser", idUser);
			query.setParameter("idVideo", idVideo);
			entity = query.getSingleResult();
			if(entity != null)
				em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception ex) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	
	
	public List<Video> findVideoByUserLike(User u) {
		emIsopen();

		TypedQuery<Video> query = em.createQuery("SELECT f.video FROM Share f WHERE f.user.id = :id", Video.class);
		query.setParameter("id", u.getId());
		return query.getResultList();
	}

	@Override
	public Share delete(String id) {
		// TODO Auto-generated method stub
		emIsopen();

		Share entity = null; 
		Long sID = Long.parseLong(id);
		try {
			em.getTransaction().begin();
			
			entity = em.find(Share.class, sID);
			//
			if(entity != null) {
				em.remove(entity);
				em.getTransaction().commit();

			}

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			em.getTransaction().rollback();
		}
		
		return entity;
	}
	
	public List<Share> findByKeyword(String keyword){
		emIsopen();

		String jpql = "SELECT  o FROM Share o"
					+" WHERE o.user.id LIKE :vid";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("vid", "%"+keyword+"%");
		
		List<Share> list = query.getResultList();

		return list;
	}
	
	public List<Share> findByKeywordVideoID(String keyword){
		emIsopen();

		String jpql = "SELECT  o FROM Share o"
					+" WHERE o.video.id LIKE :vid";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("vid", "%"+keyword+"%");
		
		List<Share> list = query.getResultList();

		return list;
	}
}
