package com.forbes.util;
import sun.misc.*;
public class BASE64 {
	//	 将 s 进行 BASE64 编码 


	public static String encode(byte [] bts) {


		return (new sun.misc.BASE64Encoder()).encode(bts);

	}
	//	 将 BASE64 编码的字符串 s 进行解码 
	public static byte[] decode(String s) {

		if (s == null)
			return null;

		BASE64Decoder decoder = new BASE64Decoder();

		try {

			byte[] b = decoder.decodeBuffer(s);

			return  b;

		} catch (Exception e) {

			return null;

		}

	}
	
}
