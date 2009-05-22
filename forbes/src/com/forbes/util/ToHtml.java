package com.forbes.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URL;

public class ToHtml {

	public static boolean toHtml(String fromUrl, String toUrl) throws Exception {
		
		try {
			URL url = new URL(fromUrl);//����URL���󣬲�ʵ����Ϊurl�����Ҫץȡ����ҳ��ַ
			BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(),"gbk"));//����BufferedReader���󣬲�ʵ����Ϊreader�������GB2312��Ҫץȡ����ҳ�����ʽ
			String line;
			String content = "";
	        while ((line = reader.readLine()) != null) {
	            content += line + "\n";
	            //content += line;
	        }
			reader.close();
			
			Writer out = new BufferedWriter(new OutputStreamWriter( new FileOutputStream(toUrl), "gbk"));
			out.write(content); 
			out.close();
			
			//System.out.println(content);
			return true;
		} catch( Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}
}
