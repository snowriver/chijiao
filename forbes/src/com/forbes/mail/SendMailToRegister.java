package com.forbes.mail;

import com.forbes.hibernate.bean.User;
import com.forbes.util.MD5;

public class SendMailToRegister {
	

	public void send(User user) {
		
		String mailstr = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*" ;
		if( !user.getEmail().matches(mailstr) )  {
			//System.out.println("�l���ʼ�ʧ��,Ո�_�J�ʼ��Ƿ����_��" + user.getEmail());
		}
		else {
			String msg = user.getLoginName() + ", ���ã� <br /><br />";
			
			msg = msg + "��л���ɹ�ע��Ϊ ����� �ĸ����û����� " +
					"<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+"' target='_bank'>���</a> ���Ｄ���ʺ�<br /><br />";

			msg = msg + "�ɹ������������ʹ�ø��๦�ܡ�<br /><br />";

			msg = msg + "������������������Ч���������Ĵ��뿽����������ĵ�ַ���У�<br /><br />";

			msg = msg + "<a href='http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+"'>" +
			"http://127.0.0.1:8080/forbes/client/ClientVerifyEmail.do?act=verify&id=" + user.getId() + "&m=" + MD5.convert(user.getLoginName())+" </a><br /><br />";

			msg = msg + "����ףԸ����Ŀ��ģ�<br /><br />";

			msg = msg + "�����";

			ForbesMailSender sender = new ForbesMailSender("smtp.163.com","xuxiaomin123","19830501");
			ForbesMail mail = new ForbesMail();
			mail.addBody(msg, mail.HTML_MAIL );
			mail.setSubject("[�����]ע��ȷ����");
			mail.setFrom("xuxiaomin123@163.com");
			mail.addTo( user.getEmail() );
				
			boolean rst = sender.doSend( mail );
			if( rst ){
				//System.out.println("���ͳɹ�...��");
			}
			else {
				throw new RuntimeException("�l���ʼ�ʧ��,Ո�_�J�ʼ��Ƿ����_");
			}
		}
				
			
		
	}
	
}
