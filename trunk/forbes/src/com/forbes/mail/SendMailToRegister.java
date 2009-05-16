package com.forbes.mail;

import com.forbes.hibernate.bean.User;
import com.forbes.util.MD5;

public class SendMailToRegister {
	

	public void send(User user) {
		
		String mailstr = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*" ;
		if( !user.getEmail().matches(mailstr) )  {
			//System.out.println("發送邮件失敗,請確認邮件是否正確：" + user.getEmail());
		}
		else {
			String msg = user.getLoginName() + ", 您好： <br /><br />";
			
			msg = msg + "感谢您成功注册为 赤脚网 的个人用户！请 " +
					"<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+"' target='_bank'>点击</a> 这里激活帐号<br /><br />";

			msg = msg + "成功激活后您可以使用更多功能。<br /><br />";

			msg = msg + "如果您点击上述链接无效，请把下面的代码拷贝到浏览器的地址栏中：<br /><br />";

			msg = msg + "<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+"'>" +
			"http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+" </a><br /><br />";

			msg = msg + "衷心祝愿您玩的开心！<br /><br />";

			msg = msg + "赤脚网";

			ForbesMailSender sender = new ForbesMailSender("smtp.163.com","xuxiaomin123","19830501");
			ForbesMail mail = new ForbesMail();
			mail.addBody(msg, mail.HTML_MAIL );
			mail.setSubject("[赤脚网]注册确认信");
			mail.setFrom("xuxiaomin123@163.com");
			mail.addTo( user.getEmail() );
				
			boolean rst = sender.doSend( mail );
			if( rst ){
				//System.out.println("发送成功...：");
			}
			else {
				throw new RuntimeException("發送邮件失敗,請確認邮件是否正確");
			}
		}
				
			
		
	}
	
}
