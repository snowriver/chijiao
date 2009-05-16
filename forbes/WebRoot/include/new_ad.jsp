<%@ page contentType="text/html; charset=gbk" %>

		<script type="text/javascript">
		// <![CDATA[
		var pics="", mylinks="", texts="", texts2="", texts3="";
		var pics="newad/01.jpg|newad/02.jpg|newad/03.jpg|newad/04.jpg";
		var mylinks="video/index.jsp|ask/index.jsp|${UC_HOME_URL}|video/VideoSearch.do?act=search&keyword=赢在中国";
		var texts="创投知识竟在掌握|创业百问|创业圈子|赢在中国";
		var texts2="学习视频|你现在正在创业吗？|我们共同的创业圈|励志照亮人生 创业改变命";
		var texts3="赤脚网提供丰富的创投视频，是你学习的园地……|在创业的过程中是否有些不好解决的问题？可以到这里寻找答案。|才华展示，共享经验，结交朋友，创业之路……|《赢在中国》不单单是创业者的游戏，也是一次全民学习做人做事，学习营销的大课堂";
				
		var indexFlash2 = new indexFlash("flash/V_new.swf","indexFlashID01","660","292","7","#ffffff");
			indexFlash2.addParam("quality", "high");
			indexFlash2.addParam("salign", "t");	
			indexFlash2.addVariable("p",pics);
			indexFlash2.addVariable("l",mylinks);
			indexFlash2.addVariable("icon",texts);
			indexFlash2.addVariable("icon_2",texts2);
			indexFlash2.addVariable("icon_3",texts3);
			indexFlash2.write("flashcontent01");
		// ]]>
		</script>