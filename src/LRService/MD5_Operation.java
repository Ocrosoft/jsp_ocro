package LRService;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * MD5 操作类
 * @author ocrosoft
 *
 */
public class MD5_Operation {
	/**
	 * 返回一个字符串的MD5值
	 * @param str 要计算MD5的字符串
	 * @return 大写的MD5值
	 */
	public static String getMD5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			return new BigInteger(1, md.digest()).toString(16).toUpperCase();
		} catch (Exception e) {
			return "";
		}
	}
}
