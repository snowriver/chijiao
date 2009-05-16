<%@ page contentType="text/html; charset=gbk" %>

			<script type="text/javascript">
				<!--
				//可编辑内容开始（可放置特版中）
				var pic_width=250; //图片宽度
				var pic_height=260; //图片高度
				var button_pos=2; //按扭位置 1左 2右 3上 4下
				var stop_time=5000; //图片停留时间(1000为1秒钟)
				var show_text=0; //是否显示文字标签 1显示 0不显示
				var txtcolor="0000ff"; //文字色
				var bgcolor="DDDDDD"; //背景色

				//可编辑内容结束
				var swf_height=show_text==1?pic_height+20:pic_height;
				var pics="", mylinks="", texts="";
				var pics="ad/01.jpg|ad/02.jpg|ad/03.jpg|ad/04.jpg|ad/05.jpg";
				var mylinks="${UC_HOME_URL}|article/index.jsp|video/VideoShow.do?id=5|video/index.jsp|ask/index.jsp";
				var texts="赶快加入创业圈，需要您的创业伙伴|创业大学|赢在中国|创业视频|创业百问";

				var indexFlash = new indexFlash("flash/focus.swf", "focus_01", pic_width, swf_height, "6");
				indexFlash.addParam("quality", "high");
				indexFlash.addParam("wmode", "opaque");
				indexFlash.addVariable("pics",pics);
				indexFlash.addVariable("links",mylinks);
				indexFlash.addVariable("texts",texts);
				indexFlash.addVariable("pic_width",pic_width);
				indexFlash.addVariable("pic_height",pic_height);
				indexFlash.addVariable("show_text",show_text);
				indexFlash.addVariable("txtcolor",txtcolor);
				indexFlash.addVariable("bgcolor",bgcolor);
				indexFlash.addVariable("button_pos",button_pos);
				indexFlash.addVariable("stop_time",stop_time);
				indexFlash.write("focus_01");
				//-->
			</script>