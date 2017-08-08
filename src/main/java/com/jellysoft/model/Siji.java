package com.jellysoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.jellysoft.utils.TextUtils;

@Entity
@Table(name="siji")
public class Siji {

	private static final String PREFIX = "token:";
	private static final String TOKEN_STATIC = "$$!!@##!@#!@###IUjaasccc";
	
	public static final int LOCKED = 1;
	public static final int NOT_LOCK = 0;
	
	
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	public int sid;
	
	//Jenkins地址
	public String account;
	
	//对应账号用户名
	public String pwd;
	
	//是否是默认显示的那个用户
	public int islocked;
	
	
	public Date created_at;
	
	
	public Date last_login;
	
	
	public String getTokenKey(){
		String md5 = TextUtils.getMD5( account + "_" + sid + "_");
		return PREFIX + md5;
		
	}
	
	/**
	 * 获取当前用户的key 以保存他的token
	 * @param phone 
	 * @param uid
	 * @return
	 */
	public static String getTokenKey( String account , String uid  ){
		String md5 = TextUtils.getMD5( account + "_" + uid + "_");
		return PREFIX + md5;
	}
	
	public String createToken(){
		long currentTime = System.currentTimeMillis();//当前时间戳
		String orinalString = sid + account + created_at.getTime() + TOKEN_STATIC + currentTime;
		return TextUtils.getMD5( orinalString);
	}
	
}
