package com.example.with.comments;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.with.alram.AlramService;

@Controller
public class CommentsController {

	@Autowired
	private CommentsService service;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AlramService aService;
	
	@Autowired
	private HttpSession session;
	//댓글 추가
	@PostMapping("/comments/add")
	public String addComments(Comments comments) {
	      comments.setMember_id((String)session.getAttribute("id"));
	      service.addComments(comments);
	      int s = service.getSeqCurrval();
	      comments.setComments_num(s);
	      aService.addAlramByComments(comments);
	      return "redirect:" + request.getHeader("REFERER")+ "#comments-" + s;
	   }
	//댓글 수정
	@PostMapping("/comments/edit")
	public String editComments(Comments comments) {
		comments.setMember_id((String)session.getAttribute("id"));
		service.editComments(comments);
		return "redirect:" + request.getHeader("REFERER");
	}


	@RequestMapping("/comments/delete")
	public String deleteCommets(@RequestParam int comments_num) {
		Comments c = service.getComments(comments_num);
		//하위 댓글이 있을 때 상위 댓글의 내용을 null로 변경한다.
		//child 코멘트 사이즈 필요한지 확인
		if (c.getChild_comments().size() != 0 || c.getTop_comments_num() != -1) {
			service.deletedTopContent(comments_num);
		} //하위 댓글이 없을때 및 하위 댓글이 전부 삭제 되었을때 댓글 삭제
		else {
			service.delComments(comments_num);
		}
	
		return "redirect:" + request.getHeader("REFERER");		
	}	

}
