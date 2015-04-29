package me.mos.ti.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import me.mos.ti.result.Result;
import me.mos.ti.result.ResultCode;
import me.ocs.commons.response.json.JSONResponseBody;
import me.ocs.commons.utils.CalendarUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author 刘飞 E-mail:liufei_it@126.com
 * 
 * @version 1.0.0
 * @since 2014年12月27日 下午2:38:54
 */
public class BaseController {

	protected final Logger log = LoggerFactory.getLogger(getClass());

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(CalendarUtils.S_YYYY_MM_DD_HH_MM_SS);
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@ExceptionHandler(Throwable.class)
	@ResponseBody
	public final ResponseEntity<String> handleException(final Throwable ex) {
		log.error("Api Request Error.", ex);
		return toResponse(Result.newError().with(ResultCode.Error_Exception), HttpStatus.INTERNAL_SERVER_ERROR);
	}

	protected ResponseEntity<String> toResponse(Result result) {
		return JSONResponseBody.newInstance().code(result.getResultCode()).message(result.getMessage()).with(result.getData()).toResponse();
	}

	protected ResponseEntity<String> toResponse(Result result, HttpStatus status) {
		return JSONResponseBody.newInstance().code(result.getResultCode()).message(result.getMessage()).with(result.getData()).toResponse(status);
	}
}