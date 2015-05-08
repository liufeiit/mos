package me.mos.ti.dao;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import me.ocs.commons.jpa.DefaultGenericDAO;

/**
 * 
 * @author 刘飞
 * 
 * @version 1.0.0
 * @since 2015年4月29日 下午5:55:02
 */
public class EntityManagerSupportGenericDAO<T, PK extends Serializable> extends DefaultGenericDAO<T, PK> {
	
	@PersistenceContext(unitName = "mos")
	protected EntityManager entityManager;
	
	@Override
	public EntityManager getEntityManager() {
		return entityManager;
	}

}