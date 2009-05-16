package com.forbes.util;
import sun.misc.*;
public class BASE64 {
	//	 �� s ���� BASE64 ���� 


	public static String encode(byte [] bts) {


		return (new sun.misc.BASE64Encoder()).encode(bts);

	}
	//	 �� BASE64 ������ַ��� s ���н��� 
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
