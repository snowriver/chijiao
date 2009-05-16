package com.forbes.util;

import java.util.Random;

public class PasswordGenerator {
	/**
	 * 生成随即密碼
	 * @param pwd_len 生成的密碼的總長度
	 * @return  密碼的字符串
	 */
	public static String genRandomNum(int pwd_len) {
		//35是因為數组是從0開始的，26个字母+10个數字
		final int maxNum = 36;
		int i; //生成的随机數
		int count = 0; //生成的密碼的長度
		char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
				'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
				'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		StringBuffer pwd = new StringBuffer("");
		Random r = new Random();
		while (count < pwd_len) {
			//生成随机數，取绝對值，防止生成负數，

			i = Math.abs(r.nextInt(maxNum)); //生成的數最大為36-1

			if (i >= 0 && i < str.length) {
				pwd.append(str[i]);
				count++;
			}
		}

		return pwd.toString();
	}

}
