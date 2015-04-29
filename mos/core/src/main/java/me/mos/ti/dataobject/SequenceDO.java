package me.mos.ti.dataobject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 序号实体类
 * 
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2015年4月12日 下午5:20:27
 */
@Entity
@Table(name = "sequence", catalog = "scape")
public class SequenceDO implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 序号类型
	 */
	@Id
	@Column(name = "id", nullable = false)
	private String sequenceType;

	/**
	 * 启始数值
	 */
	@Column(name = "start_value")
	private Long startValue;

	/**
	 * 当前数值
	 */
	@Column(name = "value")
	private Long value;

	public String getSequenceType() {
		return sequenceType;
	}

	public void setSequenceType(String sequenceType) {
		this.sequenceType = sequenceType;
	}

	public Long getStartValue() {
		return startValue;
	}

	public void setStartValue(Long startValue) {
		this.startValue = startValue;
	}

	public Long getValue() {
		return value;
	}

	public void setValue(Long value) {
		this.value = value;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sequenceType == null) ? 0 : sequenceType.hashCode());
		result = prime * result + ((startValue == null) ? 0 : startValue.hashCode());
		result = prime * result + ((value == null) ? 0 : value.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SequenceDO other = (SequenceDO) obj;
		if (sequenceType == null) {
			if (other.sequenceType != null)
				return false;
		} else if (!sequenceType.equals(other.sequenceType))
			return false;
		if (startValue == null) {
			if (other.startValue != null)
				return false;
		} else if (!startValue.equals(other.startValue))
			return false;
		if (value == null) {
			if (other.value != null)
				return false;
		} else if (!value.equals(other.value))
			return false;
		return true;
	}
}