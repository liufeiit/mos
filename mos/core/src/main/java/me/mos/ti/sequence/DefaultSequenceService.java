package me.mos.ti.sequence;

import me.mos.ti.dao.SequenceDAO;
import me.mos.ti.dataobject.SequenceDO;
import me.ocs.commons.sequence.SequenceService;
import me.ocs.commons.utils.NumberUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.transaction.annotation.Transactional;

/**
 * 序号服务实现类。
 * 
 * @author 刘飞
 * 
 * @version 1.0.0
 * @since 2015年4月27日 下午6:09:18
 */
public class DefaultSequenceService implements SequenceService {

	protected Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	@Qualifier("sequenceDAO")
	protected SequenceDAO sequenceDAO;

	protected String nextValueAsString(String sequenceType, int digits, boolean autoCreate, long startValue) {
		long value = nextValue(sequenceType, autoCreate, startValue, 1);
		return NumberUtils.formatNumber(digits, value);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public String nextValueAsString(String sequenceType, int digits) {
		return nextValueAsString(sequenceType, digits, false, 0);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public String nextValueAsStringWithCreate(String sequenceType, int digits, long startValue) {
		return nextValueAsString(sequenceType, digits, true, startValue);
	}

	protected long nextValue(String sequenceType, boolean autoCreate, long startValue, int count) {
		if (count <= 0) {
			throw new IllegalArgumentException("Count must be large than zero, count=[" + count + "]");
		}
		if (log.isDebugEnabled()) {
			log.debug("Start nextValue for seqType=[" + sequenceType + "].");
		}
		SequenceDO sequence = sequenceDAO.get(sequenceType);
		if (sequence == null) {
			if (autoCreate == false) {
				throw new RuntimeException("Not found the sequence, sequenceType=[" + sequenceType + "].");
			}
			sequence = new SequenceDO();
			sequence.setSequenceType(sequenceType);
			sequence.setStartValue(startValue);
			sequence.setValue(startValue);
			try {
				sequenceDAO.persist(sequence);
			} catch (Exception e) {
				sequence = sequenceDAO.get(sequenceType);
				if (sequence == null) {
					throw new RuntimeException("Unable init sequence, sequenceType=[" + sequenceType + "].");
				}
			}
		}
		long seqValue = sequence.getValue();
		long value = seqValue;
		while (value >= 0 && Long.MAX_VALUE - value < count) {
			// 序列值循环: 当value + count大于Long.MAX_VALUE时，从startValue重新开始累加
			count -= (Long.MAX_VALUE - value + 1);
			value = sequence.getStartValue();
		}
		sequence.setValue(value + count); // nextValue
		sequenceDAO.merge(sequence);
		if (log.isDebugEnabled()) {
			log.debug("End nextValue for seqType=[" + sequenceType + "].");
		}
		return seqValue;
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public long nextValue(String sequenceType) {
		return nextValue(sequenceType, false, 0, 1);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public long nextValues(String sequenceType, int count) {
		return nextValue(sequenceType, false, 0, count);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public long nextValueWithCreate(String sequenceType, long startValue) {
		return nextValue(sequenceType, true, startValue, 1);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public long nextValuesWithCreate(String sequenceType, long startValue, int count) {
		return nextValue(sequenceType, true, startValue, count);
	}

	@Override
	public long currentValue(String sequenceType) {
		SequenceDO sequence = sequenceDAO.get(sequenceType);
		if (sequence == null) {
			throw new RuntimeException("Not found the sequence, sequenceType=[" + sequenceType + "].");
		}
		long seqValue = sequence.getValue(); // value等于当前值 +
												// 1，当前值为Long.MAX_VALUE时value为startValue
		return (seqValue > sequence.getStartValue() ? seqValue - 1 : Long.MAX_VALUE);
	}

	@Override
	@Transactional(value = "transactionManager", rollbackFor = Throwable.class)
	public void initSequence(String sequenceType, long startValue) {
		SequenceDO sequence = new SequenceDO();
		sequence.setSequenceType(sequenceType);
		sequence.setStartValue(startValue);
		sequence.setValue(startValue);
		sequenceDAO.persist(sequence);
	}
}
