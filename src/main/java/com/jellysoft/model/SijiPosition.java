package com.jellysoft.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSONObject;

@Entity
@Table(name="siji_position")
public class SijiPosition {

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	public int pid;
	
	public double lat;
	
	public double lng;
	
	public String geo;
	
	public Date created_time;
	
	public int sid;
	
	public int direction;
	
	public int speed;
	
	@Override
	public String toString() {
		
		return "" + sid;
	}
	
	public JSONObject toJson(){
		JSONObject object = new JSONObject();
		object.put( "lat" , lat );
		object.put( "sid" , sid );
		object.put( "lng" , lng );
		object.put( "direction" , direction );
		object.put( "speed" , speed );
		return object;
		
	}
		
}
