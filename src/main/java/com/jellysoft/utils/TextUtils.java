package com.jellysoft.utils;

import java.security.MessageDigest;

import com.mysql.jdbc.StringUtils;

public class TextUtils {

	/**
	 * 获取MD5
	 * 
	 * @param message
	 * @return MD5加密后的字符串
	 */
	public static String getMD5(String message) {
		String md5str = "";
		try {
			// 1 创建一个提供信息摘要算法的对象，初始化为md5算法对象
			MessageDigest md = MessageDigest.getInstance("MD5");

			// 2 将消息变成byte数组
			byte[] input = message.getBytes();

			// 3 计算后获得字节数组,这就是那128位了
			byte[] buff = md.digest(input);

			// 4 把数组每一字节（一个字节占八位）换成16进制连成md5字符串
			md5str = bytesToHex(buff);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return md5str.toLowerCase();
	}

	/**
	 * 判断是否是手机号码
	 * @param phone 
	 * @return
	 */
	public static boolean isPhoneNumber(String phone) {
		if (phone == null)
			return false;

		if (phone.length() != 11)
			return false;
		boolean isNumber = false;
		try {
			long phoneNumber = Long.parseLong(phone);
			isNumber = true;
		} catch (NumberFormatException e) {

		}
		return isNumber;
	}

	/**
	 * 判断是否有空数据
	 * 
	 * @param params
	 * @return
	 */
	public static boolean isNullOrEmpty(String... params) {

		for (int i = 0; i < params.length; i++) {
			if (StringUtils.isNullOrEmpty(params[i])) {
				return true;
			}
		}

		return false;
	}

	private static String bytesToHex(byte[] bytes) {
		StringBuffer md5str = new StringBuffer();
		// 把数组每一字节换成16进制连成md5字符串
		int digital;
		for (int i = 0; i < bytes.length; i++) {
			digital = bytes[i];

			if (digital < 0) {
				digital += 256;
			}
			if (digital < 16) {
				md5str.append("0");
			}
			md5str.append(Integer.toHexString(digital));
		}
		return md5str.toString().toUpperCase();
	}

}
