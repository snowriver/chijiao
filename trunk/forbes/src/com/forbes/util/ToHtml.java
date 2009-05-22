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
			URL url = new URL(fromUrl);//建立URL对象，并实例化为url，获得要抓取的网页地址
			BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(),"gbk"));//建立BufferedReader对象，并实例化为reader，这里的GB2312是要抓取的网页编码格式
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
