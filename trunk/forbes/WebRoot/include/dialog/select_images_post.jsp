<%@ page contentType="text/html;charset=gbk"%>
<%@ page import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,com.jspsmart.upload.*,java.util.*,java.text.SimpleDateFormat,java.util.Date"%>

<%
	
	SmartUpload mySmartUpload = new SmartUpload();
	String uploadPath = request.getRealPath("/") + "UploadFile\\"; //mySmartUpload.getRequest().getParameter("path");
	
	//System.out.println("uploadPath"+uploadPath);
	
	long file_size_max = 3000000;
	String ext = "";
	//String url = path;  //應保证在根目錄中有此目錄的存在
	
	//初始化
	mySmartUpload.initialize(pageContext);
	
	String FileListType = "JPG,JPg,JpG,Jpg,jPG,jPg,jpG,jpg,";//只允許上载此类文件,可自行更改
	FileListType 		= FileListType + "GIF,GIf,GiF,Gif,gIF,GiF,giF,gif,";//只允許上载此类文件,可自行更改
	FileListType 		= FileListType + "PNG,PNg,PnG,Png,pNG,PnG,pnG,png,";//只允許上载此类文件,可自行更改
	FileListType 		= FileListType + "JPEG,JPEg,JPeG,JPeg,JpEG,JpEg,JpeG,Jpeg,";//只允許上载此类文件,可自行更改
	FileListType 		= FileListType + "jPEG,jPEg,JPeG,jPeg,jpEG,jpEg,jpeG,jpeg";//只允許上载此类文件,可自行更改
		
	//只允許上载此类文件
	try {
		mySmartUpload.setAllowedFilesList(FileListType);
		//上载文件
		mySmartUpload.upload();
	} catch (Exception e) {
		
		
			response.getWriter().write("<SCRIPT language=javascript>");
			response.getWriter().write("alert('只允許上傳jpg，gif，png類型文件');");
			response.getWriter().write("history.back();");
			response.getWriter().write("</script>");
		
		}

		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
		
		if (!myFile.isMissing()) {

			//String uploadPath = path;
			if(!new java.io.File(uploadPath).isDirectory()) 
				new java.io.File(uploadPath).mkdirs(); 
			ext = myFile.getFileExt();      //取得後缀名
   			int file_size=myFile.getSize();     //取得文件的大小 
   			String saveurl="";
   			if(file_size < file_size_max) {
    				//更改文件名，取得當前上傳時間的毫秒數值
			    	Calendar calendar = Calendar.getInstance();
			    	String filename = String.valueOf(calendar.getTimeInMillis());
			    	//saveurl = request.getRealPath("/") + url;
			   		saveurl = uploadPath + filename+"_temp."+ext; //保存路径
			   		myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);
    			
					//-----------------------上傳完成，開始生成缩略圖-------------------------    
			    	java.io.File file_mini = new java.io.File(saveurl);        //讀入刚才上傳的文件
			    	String newurl_mini = uploadPath + filename + "_mini."+ext;  //新的缩略圖保存地址
			    	Image src = javax.imageio.ImageIO.read(file_mini);                     //构造Image對象
			  		float tagsize_mini=160;
			    	int old_w_mini=src.getWidth(null);                                     //得到源圖宽
			    	int old_h_mini=src.getHeight(null);   
			    	int new_w_mini=0;
			    	int new_h_mini=0;                            //得到源圖長
			    	//int tempsize_mini;
			    	float tempdouble_mini; 
			    	if (old_w_mini>old_h_mini) { tempdouble_mini = old_w_mini/tagsize_mini; }
			    	else { tempdouble_mini=old_h_mini/tagsize_mini; }
			    	new_w_mini=Math.round(old_w_mini/tempdouble_mini);
			    	new_h_mini=Math.round(old_h_mini/tempdouble_mini);//计算新圖長宽
			    	
			    	BufferedImage tag_mini = new BufferedImage(new_w_mini,new_h_mini,BufferedImage.TYPE_INT_RGB);
			    	tag_mini.getGraphics().drawImage(src,0,0,new_w_mini,new_h_mini,null);       //绘制缩小後的圖
			    	FileOutputStream newimage_mini=new FileOutputStream(newurl_mini);          //输出到文件流
			    	JPEGImageEncoder encoder_mini = JPEGCodec.createJPEGEncoder(newimage_mini);       
			    	encoder_mini.encode(tag_mini);                                            //近JPEG编碼
			    	newimage_mini.close();
			   		
			   		//-----------------------上傳完成，開始生400*400的圖------------------------- 
			   		//java.io.File file = new java.io.File(saveurl);        //讀入刚才上傳的文件
			    	String newurl = uploadPath + filename + "."+ext;  //新的缩略圖保存地址
			   		float tagsize=400;
			    	int old_w=src.getWidth(null);                                     //得到源圖宽
			    	int old_h=src.getHeight(null);   
			    	int new_w=0;
			    	int new_h=0;                            //得到源圖長
			    	//int tempsize;
			    	float tempdouble; 
			    	if (old_w>old_h) { tempdouble = old_w/tagsize; }
			    	else { tempdouble=old_h/tagsize; }
			    	new_w=Math.round(old_w/tempdouble);
			    	new_h=Math.round(old_h/tempdouble);//计算新圖長宽
			    	
			    	BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
			    	tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //绘制缩小後的圖
			    	FileOutputStream newimage=new FileOutputStream(newurl);          //输出到文件流
			    	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);       
			    	encoder.encode(tag);                                            //近JPEG编碼
			    	newimage.close();
			    	
			    	java.io.File deleteFile = new java.io.File(saveurl);
			    	deleteFile.delete();
			    	
					
					
					
 				} else {
    				out.print("<SCRIPT language='javascript'>");
    				out.print("alert('上傳文件大小不能超过"+(file_size_max/1000)+"K');");
    				out.print("history.back();");
    				out.print("</SCRIPT>");
   				}
   				
   				out.print("<SCRIPT language='javascript'>");
		    	out.print("alert('上傳成功');");
		    	out.print("self.location='select_images.jsp'");
		    	out.print("</SCRIPT>");
		   			
		} else {
			
			out.print("<SCRIPT language='javascript'>");
		    out.print("alert('上傳失败');");
		    out.print("history.back();");
		    out.print("</SCRIPT>");
		}
  	
	
    
    
    


%>