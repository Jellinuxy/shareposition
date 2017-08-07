package com.jellysoft.utils;

import com.spatial4j.core.io.GeohashUtils;

import ch.hsr.geohash.GeoHash;

public class GeoUtils {
	
	private static final int radiusValue = 6;
	
	public static String latLngToGeo( double lat , double lng ){
		return GeohashUtils.encodeLatLon(lat, lng, radiusValue);
	}
	
	public static GeoHash getGeoHash( double lat , double lng ){
		return GeoHash.withCharacterPrecision(lat, lng, radiusValue);
	}
	
}
