package me.mos.ti.validator;

import java.util.HashMap;
import java.util.Map;

import me.mos.ti.ro.ValidatorRequest;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * 
 * @author 刘飞
 * 
 * @version 1.0.0
 * @since 2015年4月16日 下午6:49:12
 */
public abstract class BaseValidator implements Validator {

	abstract <T extends ValidatorRequest> Class<T> getRequestType();
	
	private final Map<String, String> Errors = new HashMap<String, String>();
	
	protected BaseValidator addError(String field, String message) {
		Errors.put(field, message);
		return this;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return getRequestType().equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		if(Errors.isEmpty()) {
			return;
		}
		for(Map.Entry<String, String> e : Errors.entrySet()) {
			ValidationUtils.rejectIfEmpty(errors, e.getKey(), e.getValue());
		}
	}
}