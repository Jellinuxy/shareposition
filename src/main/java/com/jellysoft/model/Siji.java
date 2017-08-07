package com.jellysoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="siji")
public class Siji {

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
	
}
