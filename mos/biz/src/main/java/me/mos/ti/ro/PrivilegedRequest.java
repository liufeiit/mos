package me.mos.ti.ro;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2015年2月7日 上午12:35:55
 */
public class PrivilegedRequest {
	/**
	 * 应用ID
	 */
	@NotEmpty
	private String app_id;

	/**
	 * 用于绑定应用系统用户开放ID
	 */
	@NotEmpty
	private String open_id;

	/**
	 * 访问凭证令牌
	 */
	@NotEmpty
	private String access_token;

	public String getApp_id() {
		return app_id;
	}

	public void setApp_id(String app_id) {
		this.app_id = app_id;
	}

	public String getOpen_id() {
		return open_id;
	}

	public void setOpen_id(String open_id) {
		this.open_id = open_id;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
}