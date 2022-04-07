package com.example.with.alram;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.example.with.comments.Comments;
import com.example.with.comments.CommentsService;
import com.example.with.product.Product;
import com.example.with.product.ProductService;

@Service
public class AlramService {
	@Autowired
	   private AlramMapper mapper;
	   @Autowired
	   private CommentsService cService;
	   
	   private ProductService pService;

	   
	   public AlramService(@Lazy ProductService pService) {
	         this.pService = pService;
	     }
	public void addAlram(Alram a) {
		mapper.insert(a);
	}
	
	public void addAlramByTrade(int product_num) {
		Alram a = new Alram();
		Product p = pService.getProduct(product_num);
		a.setProduct_num(p.getProduct_num());
		a.setAlram_count(1);
		a.setAlram_read(0);
		a.setAlram_type(6);
		a.setMember_id(p.getProduct_writer());
		a.setAlram_href("/product/view?product_num=" + p.getProduct_num());
		checkDuplicateAlram(a);
		
	}
	
	public void addAlramByComments(Comments c) {
		Alram a = new Alram();
		Product p = pService.getProduct(c.getProduct_num());
		a.setProduct_num(p.getProduct_num());
		a.setAlram_count(1);
		a.setAlram_read(0);
		a.setMember_id(p.getProduct_writer());
		System.out.println(c.getTop_comments_num());
		System.out.println(c.getMember_id()+ " : " + a.getMember_id());
		
		//제품 댓글 > 제품을 작성한 사람에게 / 댓글 작성자가 알람 대상자가 아닐때
		if(c.getTop_comments_num() == -1 && !c.getMember_id().equals(a.getMember_id())){
			System.out.println("제품에 댓글이 달렸습니다.");
			a.setAlram_type(1);
			a.setAlram_href("/product/view?product_num=" + p.getProduct_num() + "#comments-"
					+ c.getComments_num());
			checkDuplicateAlram(a);
		}
		if (c.getTop_comments_num() != -1) {
			System.out.println("댓글의 댓글");
			Comments pComments = cService.getComments(c.getTop_comments_num());
			a.setMember_id(pComments.getMember_id());
			if (c.getTop_comments_num() != -1 && !c.getMember_id().equals(a.getMember_id())) {
				a.setMember_id(pComments.getMember_id());
				a.setAlram_type(2);
				a.setAlram_href("/product/view?product_num=" + p.getProduct_num() + "#comments-"
						+ c.getComments_num());
				checkDuplicateAlram(a);
			}
		}
	}
	
	public void checkDuplicateAlram(Alram a) {
		if(getAlramByAlram(a) != null) {
			System.out.println("알림 수정");
			System.out.println(a);
			editAlramCount(getAlramByAlram(a).getAlram_num());
		}else {
			System.out.println("알림 추가");
			System.out.println(a);
			addAlram(a);
		}
	}
	
	//알람 선택
	public Alram getAlram(int alram_num) {
		return mapper.select(alram_num);
	}
	
	//회원 아이디의 알람 내역 가져오기
	public ArrayList<Alram> getAlramListByMember_id(String member_id){
		return mapper.selectListByMember_id(member_id);
	}
	
	//회원 아이디의 읽지 않은 알람 내역 가져오기
	public ArrayList<Alram> getAlramUnreadListByMember_id(String member_id){
		return mapper.selectUnreadListByMember_id(member_id);
	}
	
	//동일한 알람 존재여부 확인
	public Alram getAlramByAlram(Alram a) {
		return mapper.selectByAlram(a);
	}
	
	//알람 내용 수정(동일한 타입 알람 발생 시 카운트 증가)
	public void editAlramCount(int alram_num) {
		mapper.updateAlramCount(alram_num);
	}
	
	//알람 내용 확인 시 읽음 처리
	public void editAlramRead(int alram_num) {
		mapper.updateAlramRead(alram_num);
	}
	
	//알람 삭제
	public void deleteAlram(int alram_num) {
		mapper.delete(alram_num);
	}
	
	//회원 아이디의 알람 일괄 삭제
	public void deleteAlramByMember_id(String member_id) {
		mapper.deleteByMember_id(member_id);
	}
}	
