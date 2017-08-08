package com.jellysoft.utils;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;

import com.jellysoft.model.SijiPosition;

import ch.hsr.geohash.GeoHash;

public class PositionUtils {
	
	public static final String LATLNG_PRE = "latlng_";
	public static final String GEO_PRE = "GEO_";
	public static final String GEO_SET_PRE = "GEO_SET_";

	public static void saveUserPosition( int uid , String latlngInfo , ValueOperations< String , String > kv ){
		String key = LATLNG_PRE + uid;
		kv.set( key , latlngInfo );
	}

	private static void setUserGeo( String uid, String geo , ValueOperations< String , String > kv ){
		
		kv.set( uid  ,  geo);
		
	}
	
	private static String getUserGeo( String uid ,  ValueOperations< String , String > kv ){
		return kv.get( uid );
	}
	
	
	private static boolean isMemberIfTrueDelete( SetOperations set , String key , SijiPosition position ){
		Iterator iter = set.members( key ).iterator();
		while( iter.hasNext() ){
			SijiPosition p = (SijiPosition) iter.next();
			if( p.sid == position.sid ){
				set.remove( key , p );
				return true;
			}
		}
		return false;
	}
	
	
	private static boolean removeFromOld( SetOperations set , String key , int sid ){
		Iterator iter = set.members( key ).iterator();
		while( iter.hasNext() ){
			SijiPosition p = (SijiPosition) iter.next();
			if( p.sid == sid ){
				set.remove( key , p );
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 保存用户geo
	 * @param geo geohash
	 * @param uid 用户id
	 * @param redis 
	 */
	public static void saveGeo( String geo , SijiPosition position , RedisTemplate redis ){
		
		
		SetOperations set = redis.opsForSet();
		if(isMemberIfTrueDelete( set , geo , position )){
			
		}
		else{
			String oldGeo = getUserGeo( GEO_PRE + position.sid , redis.opsForValue() );
			if( oldGeo != null && !oldGeo.equals( geo ) ){
				//从原来的队列中删除
				removeFromOld( set , oldGeo , position.sid );
			}
		}
		
		
		
		//重新设置uid的geo
		setUserGeo( GEO_PRE + position.sid , geo , redis.opsForValue() );
		
		//加入新队列
		set.add( geo , position );

	}
	
	
	/**
	 * 获得geo中的所有的司机id
	 * @param geo
	 * @param set
	 * @return
	 */
	public static Set<SijiPosition> getUidsByGeo( double lat , double lng ,  RedisTemplate redis ){

		//获得周围8个
		
		SetOperations set = redis.opsForSet();
		Set<SijiPosition> positions = new HashSet<>();
		GeoHash geoHash = GeoUtils.getGeoHash( lat , lng);
		String currentBase32 = geoHash.toBase32();
		GeoHash[] adjacent = geoHash.getAdjacent();
		positions.addAll( set.members( currentBase32 ) );
		
		for (int i = 0; i < adjacent.length; i++) {
			String adjacentItem = adjacent[i].toBase32();
			positions.addAll( set.members( adjacentItem ) );
		}
		
		return positions;
		
	}
	
}
