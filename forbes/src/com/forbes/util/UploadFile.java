package com.forbes.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class UploadFile {


	public static String upload(FormFile file, HttpServletRequest request, String path, float width, float height)  {
		
		try {

			/*String contentType  = file.getContentType(); 
			String size         = (file.getFileSize() + " bytes");//�ļ���С 
			String fileName     = file.getFileName();//�ļ���*/
			String returnUrl    = "";
			String ext			= file.getFileName().substring(file.getFileName().lastIndexOf("."));
	
	        InputStream stream  = file.getInputStream();//���ļ��x�� 
	        String filePath     = request.getRealPath("/") + path;//ȡ��ǰϵͳ·��
	        
	        if(!new java.io.File(filePath).isDirectory()) 
	        	new java.io.File(filePath).mkdirs(); 
	  
	        ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
	        OutputStream bos           = new FileOutputStream(filePath + "/" + file.getFileName()); 
	        //����һ���ς��ļ�������������ς��ļ�����web���õĸ�Ŀ䛡� 
	 
	        int bytesRead = 0; 
	        byte[] buffer = new byte[8192]; 
	        while ( (bytesRead = stream.read(buffer, 0, 8192)) != -1) { 
	        	bos.write(buffer, 0, bytesRead);//���ļ���������� 
	        } 
	        bos.close(); 
	        stream.close(); 
	
	        java.io.File newFile = new java.io.File(filePath + "/" + file.getFileName());        //�x��ղ��ς����ļ�
	        returnUrl     = path + "/" + (new Date().getTime()) + ext;
	        String newurl = request.getRealPath("/") + returnUrl;  //�µ����ԈD�����ַ
	
	        //���ɿs�ԈD
	
	        Image src      = javax.imageio.ImageIO.read(newFile);                     //����Image����
	        //float tagsize  = 300;
	        int old_w      = src.getWidth(null);                                     //�õ�Դ�D��
	        int old_h      = src.getHeight(null);   
	        int new_w      = 0;
	        int new_h      = 0;                            //�õ�Դ�D�L
	        float tempdouble; 
	        if(old_w>old_h) {
	        	tempdouble = old_w/width;
	        }else  {
	        	tempdouble = old_h/height;
	        }
	        new_w = Math.round(old_w/tempdouble);
	        new_h = Math.round(old_h/tempdouble);//�����D�L��
	        BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
	        tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //������С��ĈD
	        FileOutputStream newimage=new FileOutputStream(newurl);          //������ļ���
	        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);       
	        encoder.encode(tag);                                               //��JPEG��a
	        newimage.close();    
	        			        
	        java.io.File deleteFile = new java.io.File(filePath + "/" + file.getFileName());
	    	deleteFile.delete();
	    	return returnUrl;
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	
	/*public static void main(String [] args) {
		System.out.println("[|]");
		UrlTool t = new UrlTool();
		String url = "|clientListEstMatch.do|act=match|val=NA|pno=1|estid=2509|boxid=2509";
		System.out.println(t.getUrl2(url,"[|]"));
	}*/
	
	public static String upload(FormFile file, HttpServletRequest request, String path )  {
		
		try {
			
			String returnUrl    = "";
			String ext			= file.getFileName().substring(file.getFileName().lastIndexOf("."));
	
	        InputStream stream  = file.getInputStream();//���ļ��x�� 
	        String filePath     = request.getRealPath("/") + path;//ȡ��ǰϵͳ·��
	        
	        if(!new java.io.File(filePath).isDirectory()) 
	        	new java.io.File(filePath).mkdirs(); 
	  
	        //ByteArrayOutputStream baos = new ByteArrayOutputStream(); 
	        OutputStream bos           = new FileOutputStream(filePath + "/" + file.getFileName()); 
	        //����һ���ς��ļ�������������ς��ļ�����web���õĸ�Ŀ䛡� 
	 
	        int bytesRead = 0; 
	        byte[] buffer = new byte[8192]; 
	        while ( (bytesRead = stream.read(buffer, 0, 8192)) != -1) { 
	        	bos.write(buffer, 0, bytesRead);//���ļ���������� 
	        } 
	        bos.close(); 
	        stream.close(); 
	
	        java.io.File newFile = new java.io.File(filePath + "/" + file.getFileName());        //�x��ղ��ς����ļ�
	        returnUrl     = newFile.getAbsolutePath(); //path + "/" + (new Date().getTime()) + ext;
	
	        
	    	return returnUrl;
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
