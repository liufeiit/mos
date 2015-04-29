package me.mos.ti.ro;

/**
 * 
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2015年2月7日 上午12:39:15
 */
public class PrivilegedPageRequest extends PrivilegedRequest {

	private Integer page = 1;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}