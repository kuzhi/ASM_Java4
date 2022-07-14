package asm.DAO;


import java.util.List;

import javax.persistence.Query;
import javax.persistence.TypedQuery;


import asm.entity.Favorite;
import asm.entity.Share;

public class FavoriteDAO  extends AbstractEntityDAO<Favorite>
{

	public FavoriteDAO() {
		super(Favorite.class);
		
	}
	
	@Override
	public Favorite delete(String id) {
		// TODO Auto-generated method stub
		emIsopen();

		Favorite entity = null; 
		Long fID = Long.parseLong(id);
		try {
			em.getTransaction().begin();
			
			entity = em.find(Favorite.class, fID);
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
	
	public List<Favorite> findByKeywordUserAndVideo(String userId, String videoId){
		emIsopen();

		String jpql = "SELECT o FROM Favorite o where o.user.id LIKE :idUser AND o.video.id LIKE :idVideo";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("idUser", "%"+userId+"%");
		query.setParameter("idVideo", "%"+videoId+"%");
		List<Favorite> favor = query.getResultList();
		if(favor==null) {
			return null;
		}
		return favor;
		
	}
	
	public List<Favorite> findByKeywordUser(String keyword){
		emIsopen();

		String jpql = "SELECT  o FROM Favorite o"
					+" WHERE o.user.id LIKE :vid";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		System.out.println(keyword);
		query.setParameter("vid", "%"+keyword+"%");
		System.out.println(keyword);
		
		return query.getResultList();

	
	}
	
	public List<Favorite> findByKeywordVideo(String keyword){
		emIsopen();

		String jpql = "SELECT  o FROM Favorite o"
					+" WHERE o.video.id LIKE :vid";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		System.out.println(keyword);
		query.setParameter("vid", "%"+keyword+"%");
		System.out.println(keyword);
		
		return query.getResultList();

		
	}
	
	public Favorite remove(String idUser, String idVideo) {
		// TODO Auto-generated method stub
		emIsopen();

		Favorite entity = null;
		em.getTransaction().begin();
		try {
			TypedQuery<Favorite> query = em.createQuery("SELECT  o FROM Favorite o where o.user.id LIKE :idUser AND o.video.id LIKE :idVideo", Favorite.class);
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
	
	
	
}
