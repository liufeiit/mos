package me.mos.ti.result;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2014年12月27日 下午4:43:46
 */
public class Result implements Serializable {

	private static final long serialVersionUID = 1L;

	private boolean success;
	private String message;
	private long resultCode;
	
	private Object response;

	private final Map<String, Object> data = new HashMap<String, Object>();

	public Result() {
		this(false);
	}

	public Result(boolean success) {
		super();
		this.success = success;
	}

	public static Result newError() {
		return new Result(false);
	}

	public static Result newSuccess() {
		return new Result(true);
	}
	
	public Result response(Object response) {
		this.response = response;
		return this;
	}
	
	public <T> T getResponse(Class<T> type) {
		return type.cast(response);
	}
	
	public Object getResponse() {
		return response;
	}

	public Result with(String key, Object value) {
		data.put(key, value);
		return this;
	}

	public Object get(String key) {
		return data.get(key);
	}

	public Map<String, Object> getData() {
		return data;
	}

	public Result with(ResultCode resultCode) {
		resultCode(resultCode.code);
		message(resultCode.description);
		return this;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public Result success(boolean success) {
		this.success = success;
		return this;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Result message(String message) {
		this.message = message;
		return this;
	}

	public long getResultCode() {
		return resultCode;
	}

	public void setResultCode(long resultCode) {
		this.resultCode = resultCode;
	}

	public Result resultCode(long resultCode) {
		this.resultCode = resultCode;
		return this;
	}
}