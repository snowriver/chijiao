package com.forbes.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;

public class FileTool {

	/** 
	 * 读取指定的文本文件，并返回内容 
	 * 
	 * @param path    文件路径 
	 * @param charset 文件编码 
	 * 
	 * @return 文件内容 
	 * 
	 * @throws IOException 如果文件不存在、打开失败或读取失败 
	 */  
	private static String readFile(String path, String charset) throws IOException {  
	    String content = "";  
	    BufferedReader reader = null;  
	    try {  
	        reader = new BufferedReader(new InputStreamReader(new FileInputStream(path), charset));  
	        String line;  
	        while ((line = reader.readLine()) != null) {  
	            content += line + "\n";  
	        }  
	    } finally {  
	        if (reader != null) {  
	            try {  
	                reader.close();  
	            } catch (IOException e) {  
	                // 关闭 Reader 出现的异常一般不需要处理。  
	            }  
	        }  
	    }  
	    return content;  
	} 
	
	public static boolean write(String fileName, String content) {
		try {
			Writer out = new BufferedWriter(new OutputStreamWriter( new FileOutputStream(fileName)));
			out.write(content); 
			out.close();
	        return true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
