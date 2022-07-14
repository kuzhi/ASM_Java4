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
	
	protected EntityManager emIsopen() {
		if(!em.isOpen()) {
			 em = jpaUtils.getEntityManger();

		}
		return em;
	}
	public AbstractEntityDAO(Class<T> entity) {
		this.entityClass = entity;
		// TODO Auto-generated constructor stub
	}


	public void insert(T entity) {
		emIsopen();
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
		emIsopen();

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
		emIsopen();

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
		emIsopen();

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
		emIsopen();

		
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
		emIsopen();

		try {

		TypedQuery<T> query = em.createQuery("SELECT o FROM Video o where o.active = 1 ORDER BY views DESC", entityClass);
		query.setFirstResult(page * 6);
		query.setMaxResults(6);
		return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	
	public List<T> getPagingVidFav(int page, String userId) {
		emIsopen();

		try {

		TypedQuery<T> query = em.createQuery("SELECT o FROM Favorite o WHERE o.user.id LIKE :uId", entityClass);
		query.setParameter("uId", "%"+userId+"%");

		query.setFirstResult(page * 6);
		query.setMaxResults(6);
		return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	
	
	public List<T> getPagingVid(int page) {
		emIsopen();

		try {

		TypedQuery<T> query = em.createQuery("SELECT o FROM Video o ORDER BY o.id ASC", entityClass);
		query.setFirstResult(page * 10);
		query.setMaxResults(10);
		return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	public List<T> getPaging(int page) {
		emIsopen();

		try {

		TypedQuery<T> query = em.createQuery("SELECT o FROM User o ORDER BY o.id ASC", entityClass);
		query.setFirstResult(page * 10);
		query.setMaxResults(10);
		return query.getResultList();
		} finally {
			em.close();
		}
	}
	
	public Long findAllUser() {
		
		
		emIsopen();
		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM User", Long.class);
			return (long) Math.ceil(query.getSingleResult() / 10.0);
					
					
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}	
		finally {
			em.close();
		}
		return null;
	}
	
	public Long findAllVideo() {
		emIsopen();

			
			try {
				TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM Video", Long.class);
				return (long) Math.ceil(query.getSingleResult() / 10.0);
						
						
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				
			}	
			finally {
				em.close();
			}
			return null;
		}
	
	
	
	
	public Long findAllVi() {
		emIsopen();

		
		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM Video v WHERE v.active = 1" , Long.class);
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
	
public Long findAllViFav(String userId) {
		
	emIsopen();

		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(*) FROM Favorite f WHERE f.user.id LIKE :idU", Long.class);
			query.setParameter("idU", "%"+userId+"%");

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
	
	
	public Long count() {
		emIsopen();

		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			Root<T> rt = cq.from(entityClass);
			cq.select(em.getCriteriaBuilder().count(rt));
			Query q = em.createQuery(cq);
			return (Long) q.getSingleResult();
		} finally {
			em.close();
		}

	}
	
		
} 

