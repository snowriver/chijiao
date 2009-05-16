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
	 * ��ȡָ�����ı��ļ������������� 
	 * 
	 * @param path    �ļ�·�� 
	 * @param charset �ļ����� 
	 * 
	 * @return �ļ����� 
	 * 
	 * @throws IOException ����ļ������ڡ���ʧ�ܻ��ȡʧ�� 
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
	                // �ر� Reader ���ֵ��쳣һ�㲻��Ҫ����  
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
