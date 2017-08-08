package com.jellysoft.repository;

import java.util.Date;

import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jellysoft.model.Siji;

@Repository
@Table(name="siji")
@Qualifier("sijiRepository")
public interface SijiRepository  extends CrudRepository<Siji ,Integer>{

	Siji findByAccountAndPwd( String account , String pwd );
	
	Siji findByAccount( String account );
	
	@Query("UPDATE Siji s SET s.last_login=?2 WHERE s.sid=?1")
	@Modifying
	@Transactional
	void updateLastLoginTime( int sid , Date lastLoginTime); 
	
	
	
}
