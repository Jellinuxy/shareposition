package com.jellysoft.repository;

import java.util.List;

import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jellysoft.model.SijiPosition;


@Repository
@Table(name="siji_position")
@Qualifier("sijiPositionRepository")
public interface SijiPositionRepository extends CrudRepository<SijiPosition ,Integer>{
	
	List<SijiPosition> findFirstBySidIn( Iterable<Integer> ids  );
	
}
