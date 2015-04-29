package me.mos.ti.dao.impl;

import me.mos.ti.dao.DistrictDAO;
import me.mos.ti.dao.EntityManagerSupportGenericDAO;
import me.mos.ti.dataobject.DistrictDO;

import org.springframework.stereotype.Repository;

/**
 * @author 刘飞 E-mail:liufei_it@126.com
 * 
 * @version 1.0.0
 * @since 2015年4月12日 下午11:03:49
 */
@Repository("districtDAO")
public class DefaultDistrictDAO extends EntityManagerSupportGenericDAO<DistrictDO, String> implements DistrictDAO {
	
}