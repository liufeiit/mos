package me.mos.ti.srv;

import javax.servlet.http.HttpServletRequest;

import me.mos.ti.constant.Constants;
import me.mos.ti.dao.DistrictDAO;
import me.mos.ti.result.Result;
import me.mos.ti.result.ResultCode;
import me.ocs.commons.sequence.SequenceService;
import me.ocs.commons.utils.WebUtils;
import me.ocs.oauth.token.AuthenticationProvider;
import me.ocs.oauth.token.request.LoginRequest;
import me.ocs.oauth.token.request.PrivilegedRequest;
import me.ocs.oauth.token.response.LoginResponse;
import me.ocs.oauth.token.response.PrivilegedResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * 
 * @author 刘飞 E-mail:liufei_it@126.com
 * @version 1.0.0
 * @since 2014年12月27日 下午4:21:29
 */
public class BaseService implements InitializingBean {

	protected Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	protected HttpServletRequest request;

	@Autowired
	@Qualifier("redisAuthenticationProvider")
	protected AuthenticationProvider authenticationProvider;

	@Autowired
	@Qualifier("cityDAO")
	protected DistrictDAO cityDAO;

	@Autowired
	@Qualifier("sequenceService")
	protected SequenceService sequenceService;
	
	protected Result doPrivileged(me.mos.ti.ro.PrivilegedRequest request) {
		PrivilegedRequest checkRequest = new PrivilegedRequest();
		checkRequest.setApp_id(request.getApp_id());
		checkRequest.setOpen_id(request.getOpen_id());
		checkRequest.setAccess_token(request.getAccess_token());
		PrivilegedResponse privilegedResponse = authenticationProvider.doPrivileged(checkRequest);
		if (StringUtils.isBlank(privilegedResponse.getSecret_id())) {
			return Result.newError().with(ResultCode.Error_Token);
		}
		Long user_id = NumberUtils.toLong(privilegedResponse.getSecret_id(), 0L);
		if (user_id <= 0L) {
			return Result.newError().with(ResultCode.Error_Token);
		}
		return Result.newSuccess().with(ResultCode.Success).response(user_id);
	}
	
	protected Result login(Long userId) {
		if(userId == null || userId <= 0L) {
			return Result.newError().with(ResultCode.Error_Login);
		}
		LoginRequest loginRequest = new LoginRequest();
		loginRequest.setApp_id(Constants.APP_ID);
		loginRequest.setSecret_id(String.valueOf(userId));
		LoginResponse loginResponse = authenticationProvider.doLogin(loginRequest);
		if (loginResponse == null || StringUtils.isEmpty(loginResponse.getAccess_token())) {
			return Result.newError().with(ResultCode.Error_Login);
		}
		return Result.newSuccess().with(ResultCode.Success).response(loginResponse);
	}
	
	protected final long getIp() {
		return WebUtils.ipToLng(WebUtils.getIpAddr(request));
	}

	@Override
	public final void afterPropertiesSet() throws Exception {
		init();
	}

	protected void init() throws Exception {

	}
}