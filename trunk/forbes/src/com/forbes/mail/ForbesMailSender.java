package com.forbes.mail;

import java.util.*;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;

public class ForbesMailSender {
	private MimeMessage mimeMsg; // MIME�ʼ�����

	private Session session; // �ʼ���������

	private Properties props = System.getProperties() ; // ϵͳ����

	private boolean needAuth = true; // smtp�Ƿ���Ҫ�J֤
    
	private String user ;
	
	private String password;

	public ForbesMailSender(String smtpHost, String userName, String password) {
		props.put("mail.host", smtpHost);
		props.put("mail.localhost", smtpHost);
		props.put("mail.smtp.host", smtpHost);
		props.put("mail.smtp.localhost", smtpHost);
		props.put("mail.smtp.auth", "true");
		this.user = userName;
		this.password = password;
	}
	public boolean doSend( ForbesMail mail ){
		try {
			session = Session.getDefaultInstance(props, null); // ����ʼ���������
			mimeMsg = new MimeMessage(session);
			mimeMsg.setFrom( new InternetAddress(  mail.getFrom() ) );
			List <String> toList = mail.getToList();
			for( String to : toList ){
				mimeMsg.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(to));
			}
			List <String> copyToList = mail.getCopyToList();
			for( String cc : toList ){
				mimeMsg.setRecipient(Message.RecipientType.CC,
                        new InternetAddress(cc));
			}
			mimeMsg.setSubject( mail.getSubject() );
			
			mimeMsg.setContent(mail.getMultipart());
			mimeMsg.saveChanges();
			Transport transport = session.getTransport("smtp");
			transport.connect((String) props.get("mail.smtp.host"), user,password);
			transport.sendMessage(mimeMsg, mimeMsg
					.getRecipients(Message.RecipientType.TO));
			//transport.send(mimeMsg);

			//System.out.println("send mail sucess");
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public static void main( String [] args ){
		ForbesMailSender sender = new ForbesMailSender("smtp.163.com","xuxiaomin123","19830501");
		ForbesMail mail = new ForbesMail();
		mail.addBody("<a href='test.jsp'>�ʼ����� </a>", mail.HTML_MAIL);
		mail.setSubject("�ʼ�����");
		mail.setFrom("746167@qq.com");
		mail.addTo( "746167@qq.com" );
		mail.addCopyTo( "746167@qq.com" );
		sender.doSend( mail );
	}
}
