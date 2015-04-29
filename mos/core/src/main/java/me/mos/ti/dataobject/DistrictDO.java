package me.mos.ti.dataobject;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 地区
 * 
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2015年4月12日 下午5:20:27
 */
@Entity
@Table(name = "district", catalog = "mos")
public class DistrictDO implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 编号 */
	@Id
	@Column(name = "code", nullable = false, length = 6)
	private String code;

	/** GB 2260标准编号 */
	@Column(name = "gb_code", nullable = false, length = 6)
	private String gbCode;

	/** 名称 */
	@Column(name = "name", nullable = false, length = 64)
	private String name;

	/** 等级 */
	@Column(name = "level", nullable = false)
	private Integer level;

	/** 上级行政区划代码 */
	@Column(name = "parent_code", nullable = true, length = 6)
	private String parentCode;

	/** 直辖市标志 */
	@Column(name = "municipality")
	private Boolean municipality;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getGbCode() {
		return gbCode;
	}

	public void setGbCode(String gbCode) {
		this.gbCode = gbCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}

	public Boolean getMunicipality() {
		return municipality;
	}

	public void setMunicipality(Boolean municipality) {
		this.municipality = municipality;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result + ((gbCode == null) ? 0 : gbCode.hashCode());
		result = prime * result + ((level == null) ? 0 : level.hashCode());
		result = prime * result + ((municipality == null) ? 0 : municipality.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((parentCode == null) ? 0 : parentCode.hashCode());
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
		DistrictDO other = (DistrictDO) obj;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (gbCode == null) {
			if (other.gbCode != null)
				return false;
		} else if (!gbCode.equals(other.gbCode))
			return false;
		if (level == null) {
			if (other.level != null)
				return false;
		} else if (!level.equals(other.level))
			return false;
		if (municipality == null) {
			if (other.municipality != null)
				return false;
		} else if (!municipality.equals(other.municipality))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (parentCode == null) {
			if (other.parentCode != null)
				return false;
		} else if (!parentCode.equals(other.parentCode))
			return false;
		return true;
	}
}