<%

  	//response.sendRedirect("index_article_list.jsp");
	try{
		request.getRequestDispatcher("index_article_list.jsp").forward(request,response);
	} catch(Exception e){
		e.printStackTrace();
	}
  
%>

<!-- 
<script language="javascript" >
	parent.location="index.do";
</script>
 -->