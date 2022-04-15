package asm.DAO;

import asm.entity.User;
import asm.entity.Video;

public class VideoDAO extends AbstractEntityDAO<Video>{

	public VideoDAO() {
		super(Video.class);
	}
	
	public Boolean tangLuotXem(Video entity) {
		em.getTransaction().begin();
		try {
			entity.setViews(entity.getViews() + 1);
			em.merge(entity);
			em.getTransaction().commit();
			return true;
		} catch (Exception ex) {
			em.getTransaction().rollback();
			return false;
		}
		finally{
			em.close();
		}
	}
	
}
