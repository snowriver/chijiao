<%@ page contentType="text/html; charset=gbk" %>

			<script type="text/javascript">
				<!--
				//�ɱ༭���ݿ�ʼ���ɷ����ذ��У�
				var pic_width=250; //ͼƬ���
				var pic_height=260; //ͼƬ�߶�
				var button_pos=2; //��Ťλ�� 1�� 2�� 3�� 4��
				var stop_time=5000; //ͼƬͣ��ʱ��(1000Ϊ1����)
				var show_text=0; //�Ƿ���ʾ���ֱ�ǩ 1��ʾ 0����ʾ
				var txtcolor="0000ff"; //����ɫ
				var bgcolor="DDDDDD"; //����ɫ

				//�ɱ༭���ݽ���
				var swf_height=show_text==1?pic_height+20:pic_height;
				var pics="", mylinks="", texts="";
				var pics="ad/01.jpg|ad/02.jpg|ad/03.jpg|ad/04.jpg|ad/05.jpg";
				var mylinks="${UC_HOME_URL}|article/index.jsp|video/VideoShow.do?id=5|video/index.jsp|ask/index.jsp";
				var texts="�Ͽ���봴ҵȦ����Ҫ���Ĵ�ҵ���|��ҵ��ѧ|Ӯ���й�|��ҵ��Ƶ|��ҵ����";

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