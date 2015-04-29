package me.mos.ti.dao.impl;

import me.mos.ti.dao.EntityManagerSupportGenericDAO;
import me.mos.ti.dao.SequenceDAO;
import me.mos.ti.dataobject.SequenceDO;

import org.springframework.stereotype.Repository;

/**
 * 
 * @author 刘飞
 * 
 * @version 1.0.0
 * @since 2015年4月27日 下午6:05:07
 */
@Repository("sequenceDAO")
public class DefaultSequenceDAO extends EntityManagerSupportGenericDAO<SequenceDO, String> implements SequenceDAO {
	
}