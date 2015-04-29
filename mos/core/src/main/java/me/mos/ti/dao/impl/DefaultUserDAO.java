package me.mos.ti.dao.impl;

import me.mos.ti.dao.EntityManagerSupportGenericDAO;
import me.mos.ti.dao.UserDAO;
import me.mos.ti.dataobject.UserDO;

import org.springframework.stereotype.Repository;

/**
 * @author 刘飞 E-mail:liufei_it@126.com
 * 
 * @version 1.0.0
 * @since 2014年12月19日 上午12:32:18
 */
@Repository("userDAO")
public class DefaultUserDAO extends EntityManagerSupportGenericDAO<UserDO, Long> implements UserDAO {
	
}