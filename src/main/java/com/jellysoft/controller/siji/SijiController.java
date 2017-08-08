package com.jellysoft.controller.siji;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jellysoft.model.Siji;
import com.jellysoft.model.SijiInfo;
import com.jellysoft.model.SijiPosition;
import com.jellysoft.repository.SijiInfoRepository;
import com.jellysoft.repository.SijiPositionRepository;
import com.jellysoft.repository.SijiRepository;
import com.jellysoft.utils.GeoUtils;
import com.jellysoft.utils.PositionUtils;
import com.jellysoft.utils.TextUtils;

@RestController
@RequestMapping("/car")
public class SijiController extends BaseController {

	Logger logger = Logger.getLogger(SijiController.class);

	@Autowired
	SijiPositionRepository sijiPositionRepository;

	@Autowired
	SijiRepository sijiRepository;

	@Autowired
	SijiInfoRepository sijiInfoRepository;

	// @RequestMapping( value = "/clear" )
	// public String clear(){
	//
	// Set<String> keys = redisTemplate.keys("*");
	// redisTemplate.delete(keys);
	// return backData( BackType.SUCCESS );
	//
	// }

	@RequestMapping(value = "/pposition", method = RequestMethod.POST)
	public String pushPosition(double lat, double lng, int direction, int speed) {

		// 1.TODO 判断数据合法性
		if (!checkToken()) {
			return backData(BackType.TOKEN_ERROR);
		}

		// 2.生成geo
		String geo = GeoUtils.latLngToGeo(lat, lng);
		SijiPosition position = new SijiPosition();
		position.geo = geo;
		position.lat = lat;
		position.lng = lng;
		position.speed = speed;
		position.direction = direction;
		position.sid = Integer.parseInt(getSid());

		// 保存数据库
		sijiPositionRepository.save(position);

		// 保存到redis缓存
		PositionUtils.saveGeo(geo, position, redisTemplate);

		return backData(BackType.SUCCESS);

	}

	@RequestMapping(value = "/info_pull", method = RequestMethod.GET)
	public String pullPosition(double lat, double lng) {

		if (!checkToken()) {
			return backData(BackType.TOKEN_ERROR);
		}

		Set<SijiPosition> sijis = PositionUtils.getUidsByGeo(lat, lng, redisTemplate);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cars", sijis);

		return backData(BackType.SUCCESS, map);

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String pwd) {

		// 1.判空
		if (TextUtils.isNullOrEmpty(username, pwd)) {
			return backData(BackType.LOGIN_EMPTY);
		}

		// 2.数据库获取
		Siji user = sijiRepository.findByAccountAndPwd(username, pwd);
		if (user == null) {
			return backData(BackType.LOGIN_ERROR);
		}

		// 3.判断用户是否被锁定了
		if (user.islocked == Siji.LOCKED) {
			return backData(BackType.LOGIN_LOCKED);
		}

		// 4.生成token 保存
		String token = saveToken(user);
		user.last_login = new Date();

		// 5.更新最后一次登录时间
		sijiRepository.updateLastLoginTime(user.sid, user.last_login);

		// 6.获取用户信息
		SijiInfo info = sijiInfoRepository.findOne(user.sid);

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_info", info);
		params.put("token", token);
		params.put("last_login", user.last_login);

		return backData(BackType.SUCCESS, params);

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String account, String pwd, String realname, String id, int sex, String contactphone,String carnumber) {

		// 1.判空
		if (TextUtils.isNullOrEmpty(account, pwd , realname , id , contactphone , carnumber )) {
			return backData(BackType.REGISTER_EMPTY);
		}
		
		// 2.判断用户性别是否正确
		if( sex != SijiInfo.MALE && sex != SijiInfo.FEMALE ){
			return backData( BackType.REGISTER_SEX_ERROR );
		}
		
		// 3.判断电话号码
		if( !TextUtils.isPhoneNumber( contactphone ) ){
			return backData( BackType.REGISTER_PHONE_ERROR );
		}
		
		// 4.判断用户是否存在
		Siji remoteUser = sijiRepository.findByAccount( account );
		if( remoteUser != null ){
			//用户已经存在
			return backData( BackType.REGISTER_USER_EXIST );
		}
		
		// 5.判断用户信息唯一性
		SijiInfo remoteInfo = sijiInfoRepository.findByContactphoneOrIdnumberOrCarnumber( contactphone , id, carnumber);
		if( remoteInfo != null ){
			
			if( remoteInfo.contactphone.equals( contactphone ) )
				return backData( BackType.REGISTER_PHONE_EXIST );
			else if( remoteInfo.idnumber.equals( id ) )
				return backData( BackType.REGISTER_ID_EXIST );
			else if( remoteInfo.carnumber.equals( carnumber ) )
				return backData( BackType.REGISTER_CARNUMBER_EXIST );
			
			return backData( BackType.REGISTER_ERROR );
			
		}
		
		// 6.注册
		Siji siji = new Siji();
		siji.account = account;
		siji.pwd = pwd;
		siji.created_at = new Date();
		siji.last_login = siji.created_at;
		
		sijiRepository.save( siji );
		
		// 7.保存用户信息
		SijiInfo info = new SijiInfo();
		info.sid = siji.sid;
		info.carnumber = carnumber;
		info.contactphone = contactphone;
		info.des = "";
		info.idnumber = id;
		info.realname = realname;
		info.sex = sex;
		sijiInfoRepository.save( info );
		
		// 8.保存token
		String token = saveToken( siji );
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("user_info", info);
		params.put("token", token);
		params.put("last_login", siji.last_login);
				
		return backData( BackType.SUCCESS , params );

	}

}
