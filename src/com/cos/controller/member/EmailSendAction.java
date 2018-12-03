package com.cos.controller.member;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.MemberDAO;
import com.cos.util.Gmail;
import com.cos.util.SHA256;
import com.cos.util.Script;

public class EmailSendAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url_in ="index.jsp";
		
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
		
		int emailChecked = dao.select_emailcheck(id);
		if(emailChecked == 1){
			Script.moving(response, "이미 인증된 회원입니다.");
		}else if(emailChecked == -1){
			Script.moving(response, "데이터 베이스 오류");
		}
		
		StringBuffer url = request.getRequestURL();
		String path[] = url.toString().split("/");
		String host = "";
		for(int i=0; i<path.length-1; i++){
			host += path[i]+"/";
		}
		
		System.out.println("HOST : "+ host);
		String from = "fpqmf0735@gmail.com";
		String to = dao.select_email(id);
		String salt = dao.select_salt(id);
		String code = SHA256.getEncrypt(to, salt);
		
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. "
				+ "<a href='"+host+"/gmail/emailCheckAction.jsp?code="+code+"'>이메일 인증하기</a>";
				
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.sockerFactory.fallback", "false");
		
		try{
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html; charset=UTF8");
			
			//메일전송 코드
			Transport.send(msg);
			Script.moving(response, "이메일 주소 인증 메일이 전송되었습니다. 회원가입시 입력했던 이메일에 들어가셔서 인증해주세요.", url_in);
		}catch(Exception e){
			Script.moving(response, "오류가 발생했습니다.");
		}
		
		
	}

}
