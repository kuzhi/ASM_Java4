package asm.jpa;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class jpaUtils {
	private static EntityManagerFactory factory;
	
	public static EntityManager getEntityManger() {
		if(factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("ABC");
		}
		return factory.createEntityManager();
	}
	public static void shutdown() {
		if(factory != null || factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
