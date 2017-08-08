package com.jellysoft.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="siji_info")
public class SijiInfo {

	
	public static final int MALE = 1;//男
	
	public static final int FEMALE = 2;//女
	
	@Id
	public int sid;
	
	public String realname;
	
	public String idnumber;
	
	public String contactphone;
	
	public String carnumber;
	
	public String des;
	
	//1 男      2 女
	public int sex;
	
	
	
}
