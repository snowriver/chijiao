package com.forbes.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URL;

public class ToHtml {

	public static boolean toHtml(String fromUrl, String toUrl, String fromEnCode, String toEnCode) 
		throws Exception {
		
		try {
			URL url = new URL(fromUrl);//����URL���󣬲�ʵ����Ϊurl�����Ҫץȡ����ҳ��ַ
			BufferedReader reader = 
				new BufferedReader(new InputStreamReader(url.openStream(), fromEnCode));
				//����BufferedReader���󣬲�ʵ����Ϊreader�������GB2312��Ҫץȡ����ҳ�����ʽ
			String line;
			String content = "";
	        while ((line = reader.readLine()) != null) {
	            content += line + "\n";
	        }
			reader.close();
			
			Writer out = 
				new BufferedWriter(new OutputStreamWriter( new FileOutputStream(toUrl), toEnCode));
			out.write(content); 
			out.close();
			return true;
		} catch( Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static boolean toTxt(String content, String toUrl, String toEnCode) throws Exception {
		try {			
			Writer out = 
				new BufferedWriter(new OutputStreamWriter( new FileOutputStream(toUrl), toEnCode));
			out.write(content);
			out.close();
			return true;
		} catch( Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
