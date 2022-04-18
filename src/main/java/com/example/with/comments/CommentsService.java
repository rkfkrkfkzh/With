package com.example.with.comments;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.with.alram.AlramService;
import com.example.with.member.MemberService;

@Service
public class CommentsService {

	@Autowired
	private CommentsMapper mapper;
	
	@Autowired
	private MemberService mService;
	


	
	//댓글 추가
	public void addComments(Comments c) {
		mapper.insertComments(c);
		//알람 구현 부분
	}

	//댓글 내용 가져오기
	public Comments getComments(int comments_num) {
		//한개의 댓글 내용
		Comments c = mapper.selectByCommentsNum(comments_num);
		//댓글의 자식 댓글목록
		ArrayList<Comments> cList = getCommentsByTopCommentsNum(comments_num);
		for (int i = 0; i < cList.size(); i++) {
			Comments cComments = cList.get(i);
			cComments.setMember(mService.getMember(cComments.getMember_id()));
			cList.set(i, cComments);
		}
		c.setChild_comments(cList);
		c.setMember(mService.getMember(c.getMember_id()));
		return c;
	}

	//제품번호의 댓글 가져오기
	public ArrayList<Comments> getCommentsByProductNum(int product_num) {
		ArrayList<Comments> list = mapper.selectByProductNum(product_num);
		for (int i = 0; i < list.size(); i++) {
			list.set(i, getComments(list.get(i).getComments_num()));
			//부모가 없는 댓글만 리스트에 넣는다.
			if (list.get(i).getTop_comments_num() != -1) {
				list.remove(i);
				i--;
			}
		}
		return list;
	}

	//작성자의 댓글 목록
	public ArrayList<Comments> getCommentsByWriter_id(String member_id) {
		return mapper.selectByMemberId(member_id);
	}

	//댓글의 하위 댓글만 가져오기
	private ArrayList<Comments> getCommentsByTopCommentsNum(int top_comments_num) {
		return mapper.selectByTopCommentsNum(top_comments_num);
	}

	//댓글 수정
	public void editComments(Comments c) {
		mapper.updateComments(c);
	}

	//댓글 삭제
	public void delComments(int comments_num) {
		mapper.deleteComments(comments_num);
	}

	//상위 댓글 내용 삭제시 상위 댓글 내용 null값 만들기
	public void deletedTopContent(int comments_num) {
		mapper.deletedTopContent(comments_num);
	}

	//현재 번호 알람 구현시 필요
	public int getSeqCurrval() {
		return mapper.selectSeqCurrval();
	}

}