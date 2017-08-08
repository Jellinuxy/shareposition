package com.jellysoft.controller.siji;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;

import com.alibaba.fastjson.JSONObject;
import com.jellysoft.model.Siji;
import com.jellysoft.utils.TextUtils;

/**
 * 基类，提供通用方法
 * @author Administrator
 *
 */
public class BaseController {


	
	
	public enum BackType {
		
		SUCCESS("成功"),
		TOKEN_ERROR("token错误，请重新登录"),
		LOGIN_EMPTY("账号或者密码未输入请重试。"),
		LOGIN_ERROR("账号或者密码错误，请重试。"), 
		LOGIN_LOCKED("您的账号已被锁定，请联系管理员申诉解锁。"),
		REGISTER_EMPTY( "注册信息不全，请重试。" ),
		REGISTER_SEX_ERROR( "注册性别有错误，请重试。" ),
		REGISTER_PHONE_ERROR( "电话号码有误，请重试。" ),
		REGISTER_USER_EXIST("账号已经使用，请重试。"),
		REGISTER_PHONE_EXIST("电话号码已经注册，请重试。"),
		REGISTER_ID_EXIST("身份证号码已经注册，请重试。"),
		REGISTER_CARNUMBER_EXIST("车牌已经注册，请重试。"),
		REGISTER_ERROR("注册失败，请核对信息后重试。")
		
		

		;
		private String message;

		BackType() {
			this("");
		}

		BackType(String value) {
			this.message = value;
		}

		public String getMessage() {
			return message;
		}

		public int index() {
			return this.ordinal();
		}

	}

	@Autowired
	protected RedisTemplate redisTemplate;
	
	@Autowired
	protected HttpServletRequest request;
	
	/**
	 * 验证用户token
	 * 
	 * @param phone
	 *            用户电话号码
	 * @param uid
	 *            用户id
	 * @param token
	 *            用户秘钥
	 * @return
	 */
	protected boolean checkToken(String account, String sid, String token) {

		if (TextUtils.isNullOrEmpty( account , sid , token ))
			return false;

		// 获取到key  TODO
		String key = Siji.getTokenKey(account, sid);

		// 获取token
		ValueOperations<String, String> redis = redisTemplate.opsForValue();
		String serverToken = redis.get(key);
		

		if (!token.equals(serverToken)) {
			return false;
		}

		return true;
	}
	
	
	
	
	/**
	 * 验证用户token
	 * @return
	 */
	protected boolean checkToken(){
		
		String account = request.getHeader( "account" );
		String sid = request.getHeader( "sid" );
		String token = request.getHeader( "token" );
		
		return checkToken( account , sid , token );
		
	}
	
	
	/**
	 * 获得用户sid
	 * @return
	 */
	protected String getSid(){
		return request.getHeader( "sid" );
	}
	

	/** TODO
	 * 用户保存token
	 * @param user 用户
	 * @return
	 */
	protected String saveToken(Siji user) {
		// 处理用户Token 保存redis然后返回给用户 key应该是用户的phone以及uid
		String tokenKey = user.getTokenKey();
		String token = user.createToken();


		// 保存到redis
		ValueOperations<String, String> redis = redisTemplate.opsForValue();
		redis.set(tokenKey, token);
		return token;
	}

	protected String backData(BackType backType, Map<String, Object> data) {

		JSONObject object = new JSONObject();
		object.put("code", backType.index());
		object.put("msg", backType.getMessage());
		if (data != null)
			object.put("data", data);
		return object.toJSONString();

	}

	protected String backData(BackType backType) {

		JSONObject object = new JSONObject();
		object.put("code", backType.index());
		object.put("msg", backType.getMessage());
		return object.toJSONString();

	}
	
	
}	
