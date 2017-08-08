package com.jellysoft.repository;

import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jellysoft.model.SijiInfo;

@Repository
@Table(name="siji_info")
@Qualifier("sijiInfoRepository")
public interface SijiInfoRepository extends CrudRepository<SijiInfo ,Integer>{
	
	SijiInfo findByContactphoneOrIdnumberOrCarnumber( String phone , String id , String carnumber );
	
}
