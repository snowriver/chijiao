<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,com.jspsmart.upload.*,java.util.*,java.text.SimpleDateFormat,java.util.Date"%>

<%
	
	SmartUpload mySmartUpload = new SmartUpload();
	String uploadPath = request.getRealPath("/") + "UploadFile\\"; //mySmartUpload.getRequest().getParameter("path");
	
	//System.out.println("uploadPath"+uploadPath);
	
	long file_size_max = 3000000;
	String ext = "";
	//String url = path;  //����֤�ڸ�Ŀ����д�Ŀ䛵Ĵ���
	
	//��ʼ��
	mySmartUpload.initialize(pageContext);
	
	String FileListType = "JPG,JPg,JpG,Jpg,jPG,jPg,jpG,jpg,";//ֻ���S���ش����ļ�,�����и���
	FileListType 		= FileListType + "GIF,GIf,GiF,Gif,gIF,GiF,giF,gif,";//ֻ���S���ش����ļ�,�����и���
	FileListType 		= FileListType + "PNG,PNg,PnG,Png,pNG,PnG,pnG,png,";//ֻ���S���ش����ļ�,�����и���
	FileListType 		= FileListType + "JPEG,JPEg,JPeG,JPeg,JpEG,JpEg,JpeG,Jpeg,";//ֻ���S���ش����ļ�,�����и���
	FileListType 		= FileListType + "jPEG,jPEg,JPeG,jPeg,jpEG,jpEg,jpeG,jpeg";//ֻ���S���ش����ļ�,�����и���
		
	//ֻ���S���ش����ļ�
	try {
		mySmartUpload.setAllowedFilesList(FileListType);
		//�����ļ�
		mySmartUpload.upload();
	} catch (Exception e) {
		
		
			response.getWriter().write("<SCRIPT language=javascript>");
			response.getWriter().write("alert('ֻ���S�ς�jpg��gif��png����ļ�');");
			response.getWriter().write("history.back();");
			response.getWriter().write("</script>");
		
		}

		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		
		if (!myFile.isMissing()) {

			//String uploadPath = path;
			if(!new java.io.File(uploadPath).isDirectory()) 
				new java.io.File(uploadPath).mkdirs(); 
			ext = myFile.getFileExt();      //ȡ����׺��
   			int file_size=myFile.getSize();     //ȡ���ļ��Ĵ�С 
   			String saveurl="";
   			if(file_size < file_size_max) {
    				//�����ļ�����ȡ�î�ǰ�ς��r�g�ĺ��딵ֵ
			    	Calendar calendar = Calendar.getInstance();
			    	String filename = String.valueOf(calendar.getTimeInMillis());
			    	//saveurl = request.getRealPath("/") + url;
			   		saveurl = uploadPath + filename+"_temp."+ext; //����·��
			   		myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);
    			
					//-----------------------�ς���ɣ��_ʼ�������ԈD-------------------------    
			    	java.io.File file_mini = new java.io.File(saveurl);        //�x��ղ��ς����ļ�
			    	String newurl_mini = uploadPath + filename + "_mini."+ext;  //�µ����ԈD�����ַ
			    	Image src = javax.imageio.ImageIO.read(file_mini);                     //����Image����
			  		float tagsize_mini=160;
			    	int old_w_mini=src.getWidth(null);                                     //�õ�Դ�D��
			    	int old_h_mini=src.getHeight(null);   
			    	int new_w_mini=0;
			    	int new_h_mini=0;                            //�õ�Դ�D�L
			    	//int tempsize_mini;
			    	float tempdouble_mini; 
			    	if (old_w_mini>old_h_mini) { tempdouble_mini = old_w_mini/tagsize_mini; }
			    	else { tempdouble_mini=old_h_mini/tagsize_mini; }
			    	new_w_mini=Math.round(old_w_mini/tempdouble_mini);
			    	new_h_mini=Math.round(old_h_mini/tempdouble_mini);//�����D�L��
			    	
			    	BufferedImage tag_mini = new BufferedImage(new_w_mini,new_h_mini,BufferedImage.TYPE_INT_RGB);
			    	tag_mini.getGraphics().drawImage(src,0,0,new_w_mini,new_h_mini,null);       //������С��ĈD
			    	FileOutputStream newimage_mini=new FileOutputStream(newurl_mini);          //������ļ���
			    	JPEGImageEncoder encoder_mini = JPEGCodec.createJPEGEncoder(newimage_mini);       
			    	encoder_mini.encode(tag_mini);                                            //��JPEG��a
			    	newimage_mini.close();
			   		
			   		//-----------------------�ς���ɣ��_ʼ��400*400�ĈD------------------------- 
			   		//java.io.File file = new java.io.File(saveurl);        //�x��ղ��ς����ļ�
			    	String newurl = uploadPath + filename + "."+ext;  //�µ����ԈD�����ַ
			   		float tagsize=400;
			    	int old_w=src.getWidth(null);                                     //�õ�Դ�D��
			    	int old_h=src.getHeight(null);   
			    	int new_w=0;
			    	int new_h=0;                            //�õ�Դ�D�L
			    	//int tempsize;
			    	float tempdouble; 
			    	if (old_w>old_h) { tempdouble = old_w/tagsize; }
			    	else { tempdouble=old_h/tagsize; }
			    	new_w=Math.round(old_w/tempdouble);
			    	new_h=Math.round(old_h/tempdouble);//�����D�L��
			    	
			    	BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
			    	tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //������С��ĈD
			    	FileOutputStream newimage=new FileOutputStream(newurl);          //������ļ���
			    	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);       
			    	encoder.encode(tag);                                            //��JPEG��a
			    	newimage.close();
			    	
			    	java.io.File deleteFile = new java.io.File(saveurl);
			    	deleteFile.delete();
			    	
					
					
					
 				} else {
    				out.print("<SCRIPT language='javascript'>");
    				out.print("alert('�ς��ļ���С���ܳ���"+(file_size_max/1000)+"K');");
    				out.print("history.back();");
    				out.print("</SCRIPT>");
   				}
   				
   				out.print("<SCRIPT language='javascript'>");
		    	out.print("alert('�ς��ɹ�');");
		    	out.print("self.location='select_images.jsp'");
		    	out.print("</SCRIPT>");
		   			
		} else {
			
			out.print("<SCRIPT language='javascript'>");
		    out.print("alert('�ς�ʧ��');");
		    out.print("history.back();");
		    out.print("</SCRIPT>");
		}
  	
	
    
    
    


%>