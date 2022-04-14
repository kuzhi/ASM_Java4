package asm.DAO;

import javax.persistence.TypedQuery;

import asm.entity.Share;

public class ShareDAO extends AbstractEntityDAO<Share>{

	public ShareDAO() {
		// TODO Auto-generated constructor stub
		super(Share.class);
	}
	
	
	
	public Share remove(String idUser, String idVideo) {
		// TODO Auto-generated method stub
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
}
