package asm.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import asm.DAO.FavoriteDAO;
import asm.entity.Favorite;
import asm.entity.Share;
import asm.entity.User;
import asm.entity.Video;

public class VideoDAO extends AbstractEntityDAO<Video>{
	public FavoriteDAO fDao = new FavoriteDAO();
	public ShareDAO sDao = new ShareDAO();

	
	public VideoDAO() {
		super(Video.class);
	}
	
	public Boolean tangLuotXem(Video entity) {
		emIsopen();

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
	
	@Override
	public Video delete(String id) {
		// TODO Auto-generated method stub
		emIsopen();

		Video entity = null; 
			try {
				em.getTransaction().begin();
				List<Favorite> entityF = fDao.findByKeywordVideo(id);
				List<Share> entityS = sDao.findByKeywordVideoID(id);
				
				if(entityF !=null) {
					for(Favorite f : entityF) {
						String de = String.valueOf(f.getId());
						fDao.delete(de);
					}
				}
				
				if(entityS !=null) {
					for(Share s : entityS) {
						String de = String.valueOf(s.getShardeID());
						sDao.delete(de);
					}
				}
				
				
				
				entity = em.find(Video.class, id);

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
	
	public List<Video> getVideo(List<String> idVideos) {
		emIsopen();

		TypedQuery<Video> query = em.createQuery("FROM Video WHERE id in (:idvideos)", Video.class);
		query.setParameter("idvideos", idVideos);
	
		return query.getResultList();
	}
	
	
	public List<Video> findByTitle(String titleVideo) {
		emIsopen();

		TypedQuery<Video> query = em.createQuery("FROM Video WHERE title LIKE :idvideos", Video.class);
		query.setParameter("idvideos", "%"+titleVideo+"%");
	
		return query.getResultList();
	}
}
