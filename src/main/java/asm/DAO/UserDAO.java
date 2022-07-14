package asm.DAO;

import java.util.List;

import javax.persistence.TypedQuery;

import asm.DAO.FavoriteDAO;



import asm.entity.Favorite;
import asm.entity.Share;
import asm.entity.User;
import asm.entity.Video;

public class UserDAO  extends AbstractEntityDAO<User>{
	public FavoriteDAO fDao = new FavoriteDAO();
	public ShareDAO sDao = new ShareDAO();

	public UserDAO() {
		super(User.class);
	}
	
@Override
public User delete(String id) {
	emIsopen();

	// TODO Auto-generated method stub
		User entity = null; 
		try {
			em.getTransaction().begin();
			List<Favorite> entityF = fDao.findByKeywordUser(id);
			List<Share> entityS = sDao.findByKeyword(id);
			
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
			
			
			
			entity = em.find(User.class, id);

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
		
public List<User> findByUser(String id,String email) {
	emIsopen();

	TypedQuery<User> query = em.createQuery("FROM User WHERE id LIKE :id AND email LIKE :email", User.class);
	query.setParameter("id", "%"+id+"%");
	query.setParameter("email", "%"+email+"%");

	return query.getResultList();
}
}
