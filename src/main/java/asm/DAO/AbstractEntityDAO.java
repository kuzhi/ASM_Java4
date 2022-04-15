package asm.DAO;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityGraph;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.FlushModeType;
import javax.persistence.LockModeType;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.Metamodel;

import org.hibernate.query.criteria.internal.CriteriaBuilderImpl;

import asm.jpa.jpaUtils;

public abstract class AbstractEntityDAO<T> {

	private Class<T> entityClass;
	EntityManager em = jpaUtils.getEntityManger();

	@Override
	protected void finalize() throws Throwable{
		em.close();
	
	}
	
	
	public AbstractEntityDAO(Class<T> entity) {
		this.entityClass = entity;
		// TODO Auto-generated constructor stub
	}


	public void insert(T entity) {
		EntityManager em = jpaUtils.getEntityManger();

		try {
			em.getTransaction().begin();
			
			//
			
			em.persist(entity);
			em.getTransaction().commit();

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			em.getTransaction().rollback();
		}
		
		
	}
	
	public void update(T entity) {
		try {
			em.getTransaction().begin();
			
			//
			
			em.merge(entity);
			em.getTransaction().commit();

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			em.getTransaction().rollback();
		}
	}
	
	
	public T delete(String id) {
		
		 T entity = null; 
		try {
			em.getTransaction().begin();
			
			entity = em.find(entityClass, id);
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
	
	public T findByID(String id) {
		
		T entity = null;
		
		try {
			em.getTransaction().begin();

			entity = em.find(entityClass, id);
			//
			em.getTransaction().commit();

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			em.getTransaction().rollback();
		}
		
		return entity;
	}
	
	
	public List<T> findAll() {
		
		
		EntityManager em = jpaUtils.getEntityManger();
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			cq.select(cq.from(entityClass));
			return em.createQuery(cq).getResultList();
		} finally {
			em.close();
		}
	}
	
	public List<T> getVideoPaging(int page) {
		TypedQuery<T> query = em.createQuery("FROM Video ORDER BY views DESC", entityClass);
		query.setFirstResult(page * 6);
		query.setMaxResults(6);
		return query.getResultList();
	}
	
	public Long findAllVi() {
		
		
		EntityManager em = jpaUtils.getEntityManger(); 
		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM Video", Long.class);
			return (long) Math.ceil(query.getSingleResult() / 6.0);
					
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}	
		finally {
			em.close();
		}
		return null;
	}
	
	
	
		
} 

