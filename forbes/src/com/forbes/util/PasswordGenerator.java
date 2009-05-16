package com.forbes.util;

import java.util.Random;

public class PasswordGenerator {
	/**
	 * �����漴�ܴa
	 * @param pwd_len ���ɵ��ܴa�Ŀ��L��
	 * @return  �ܴa���ַ���
	 */
	public static String genRandomNum(int pwd_len) {
		//35����锵���Ǐ�0�_ʼ�ģ�26����ĸ+10������
		final int maxNum = 36;
		int i; //���ɵ������
		int count = 0; //���ɵ��ܴa���L��
		char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
				'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
				'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		StringBuffer pwd = new StringBuffer("");
		Random r = new Random();
		while (count < pwd_len) {
			//�����������ȡ����ֵ����ֹ���ɸ�����

			i = Math.abs(r.nextInt(maxNum)); //���ɵĔ�����36-1

			if (i >= 0 && i < str.length) {
				pwd.append(str[i]);
				count++;
			}
		}

		return pwd.toString();
	}

}
