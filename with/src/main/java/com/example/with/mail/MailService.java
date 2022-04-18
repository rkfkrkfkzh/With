package com.example.with.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.with.product.Product;
import com.example.with.product.ProductService;


@Service
public class MailService {
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	public void sendMail(int product_num) {
		//수신 대상이 다수일 경우
//		ArrayList<String> toUser = new ArrayList<>();
//		수신대상 설정
//		toUserList.add("수신대상1@naver.com");
//		toUserList.add("수신대상2@naver.com");
//		수신 대상의 수
//		ing toUserSize = toUser.size();

		//수신대상 단일설정
		Product p = pService.getProduct(product_num);
		
		String user_id = p.getProduct_writer();
		
		//보내는 이의 닉네임
		String sender_nick = (String)session.getAttribute("nick");
		
		//거래 신청글 제목
		String product_title = p.getProduct_title();
		
		//SimpleMailMessage(단순 텍스트로 구성된 메세지 생성시 이용)
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		System.out.println(sender_nick);
		System.out.println(product_num);
		System.out.println(user_id);
		System.out.println(product_title);
		//수신자 설정
		simpleMessage.setTo(user_id);
		
		//메일 제목
		simpleMessage.setSubject("With:"+ sender_nick +"님으로부터 거래신청");
		
		//메일 내용
		
		simpleMessage.setText(sender_nick + "님으로부터 게시글 : "+product_title+"의 거래 신청이 있습니다. 홈페이지에서 확인하여 주세요!  http://localhost:8081/"  );
		
		
		//메일 발송
		javaMailSender.send(simpleMessage);
		
	}
}
