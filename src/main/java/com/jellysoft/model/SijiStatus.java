package com.jellysoft.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="siji_status")
public class SijiStatus {
		
	@Id
	public int sid;
	
	public int status;   //0 未上班     1上班可接客   2上班正在接客   3上班有急事
	
}