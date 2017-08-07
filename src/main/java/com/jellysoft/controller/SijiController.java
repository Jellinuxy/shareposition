package com.jellysoft.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.jellysoft.model.SijiPosition;
import com.jellysoft.repository.SijiPositionRepository;
import com.jellysoft.utils.GeoUtils;
import com.jellysoft.utils.PositionUtils;

@RestController
@RequestMapping( "/car" )
public class SijiController extends BaseController{
	
	Logger logger = Logger.getLogger( SijiController.class );
	
	
	@Autowired
	SijiPositionRepository sijiPositionRepository;
	
	
	@RequestMapping( value = "/clear"  )
	public String clear(){
		
		Set<String> keys = redisTemplate.keys("*");
        redisTemplate.delete(keys);
		return backData( BackType.SUCCESS );
		
	}
	
	@RequestMapping( value = "/pposition" , method = RequestMethod.POST )
	public String pushPosition(  int uid, String token, double lat , double lng , int direction , int speed ){
		
		//1.TODO 判断数据合法性
		
		
		//2.生成geo
		String geo = GeoUtils.latLngToGeo( lat , lng );
		SijiPosition position = new SijiPosition();
		position.geo = geo;
		position.lat = lat;
		position.lng = lng;
		position.speed = speed;
		position.direction = direction;
		position.sid = uid;
		
		//保存数据库
		sijiPositionRepository.save( position );
		
		
		//保存到redis缓存
		PositionUtils.saveGeo( geo , position, redisTemplate );
		
		
		
		
		
		return backData( BackType.SUCCESS );
		
	}
	
	@RequestMapping( value="/info_pull" , method=RequestMethod.GET )
	public String pullPosition( int uid , String token , double lat , double lng  ){
	
		Set<SijiPosition> sijis = PositionUtils.getUidsByGeo( lat , lng , redisTemplate );
			
		Map<String, Object> map = new HashMap<String,Object>();
		map.put( "cars" , sijis );

		return backData( BackType.SUCCESS , map );
		
	}
	
	
}
