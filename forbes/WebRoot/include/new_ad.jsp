<%@ page contentType="text/html; charset=gbk" %>

		<script type="text/javascript">
		// <![CDATA[
		var pics="", mylinks="", texts="", texts2="", texts3="";
		var pics="newad/01.jpg|newad/02.jpg|newad/03.jpg|newad/04.jpg";
		var mylinks="video/index.jsp|ask/index.jsp|${UC_HOME_URL}|video/VideoSearch.do?act=search&keyword=Ӯ���й�";
		var texts="��Ͷ֪ʶ��������|��ҵ����|��ҵȦ��|Ӯ���й�";
		var texts2="ѧϰ��Ƶ|���������ڴ�ҵ��|���ǹ�ͬ�Ĵ�ҵȦ|��־�������� ��ҵ�ı���";
		var texts3="������ṩ�ḻ�Ĵ�Ͷ��Ƶ������ѧϰ��԰�ء���|�ڴ�ҵ�Ĺ������Ƿ���Щ���ý�������⣿���Ե�����Ѱ�Ҵ𰸡�|�Ż�չʾ�������飬�ύ���ѣ���ҵ֮·����|��Ӯ���й����������Ǵ�ҵ�ߵ���Ϸ��Ҳ��һ��ȫ��ѧϰ�������£�ѧϰӪ���Ĵ����";
				
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