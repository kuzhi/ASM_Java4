package asm.DAO;

import javax.persistence.EntityManager;

import asm.entity.Logger;
import asm.entity.User;
import asm.jpa.jpaUtils;



public class LoggersDAO {
	
	private EntityManager em = jpaUtils.getEntityManger();

	
	@Override
	protected void finalize() throws Throwable{
		em.close();
	
	}
	
	
	public Logger create(Logger entity) {
		em.getTransaction().begin();

		try {
			
			//Ma thao tac
			em.persist(entity);
			
			///
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
			System.out.println("them moi that bai");
			e.printStackTrace();
		}
		return entity;
	}
	
	public Logger setModel(User user, String uri) {
		Logger logger = new Logger();
		logger.setUser(user);
		logger.setUri(uri);
		return logger;
	}
}
