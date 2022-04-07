package com.example.with.notice;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.with.member.Member;
import com.example.with.member.MemberService;

@Controller //해당 클래스 컨트롤러로 동작
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	@Autowired
	private MemberService mService;
	@Autowired
	private HttpSession session;
	
	@GetMapping(value = "/notice/notice_writing")
	public void noticeForm() {
		
	}
	
	@PostMapping(value = "/notice/notice_writing")
	public String insert(Notice n) {
		String path = "redirect:/member/login";
		String id = (String) session.getAttribute("id"); // getAttribute 메서드로 세션에 저장된 값을 조회할 수 있다. 리턴 타입은 Object이므로 형변환이 필요하다. 
														 // 메서드 setAttribute에 이용한 name을 알고 있으면 다음과 같이 조회할 수 있다.
		if (id != null) {
			Member m = mService.getMember(id);
			if (m.getType() == 2) {
				nService.addNotice(n);
				path = "redirect:/notice/notice_board";
			}
		}
		return path;
	}
// 뷰의 요청 경로 지정 요청경로("/notice/notice_contentView")
	@RequestMapping(value = "/notice/notice_contentView") // /notice/notice_contentView 접속시 어노테이션을 가진 메소드로 매핑이 됩니다. 
	public ModelAndView content(@RequestParam(value = "notice_num") int notice_num) { //@RequestParam("가져올 데이터 이름")[데이터타입][가져온데이터를 담을 변수]
		ModelAndView mav = new ModelAndView("/notice/notice_contentView");//뷰의 이름
		Notice n = nService.selectNoticeByNum(notice_num);
		mav.addObject("n", n); //뷰로 보낼 데이터 값
		return mav; // ModelAndView 객체 반환

	}
// 뷰의 요청 경로 지정 요청경로("/notice/notice_board")
	@RequestMapping(value = "/notice/notice_board")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/notice/notice_board");//뷰의 이름
		ArrayList<Notice> list = (ArrayList<Notice>) nService.selectAllNotice();
		String id = (String)session.getAttribute("id");// getAttribute 메서드로 세션에 저장된 값을 조회할 수 있다. 
		Member m = mService.getMember(id);
		int type = m.getType();
		session.setAttribute("type", type);// setAttribute는 ("name", value) 객체 Object를 저장하는 메서드다.
		System.out.println(list);
		Collections.reverse(list); // Collections.reverse() 메소드는 파라미터로 받은 List를 거꾸로 뒤집습니다.
		mav.addObject("list", list); //뷰로 보낼 데이터 값
		return mav; // ModelAndView 객체 반환
	}
// 뷰의 요청 경로 지정 요청경로("/notice/notice_edit")
	@RequestMapping(value = "/notice/notice_edit")
	public String edit(Notice n) {
		nService.editNotice(n);
		return "redirect:/notice/notice_board";
	}
// 뷰의 요청 경로 지정 요청경로("/notice/notice_delete")
	@RequestMapping(value = "/notice/notice_delete")
	public String delete(@RequestParam(value = "notice_num") int notice_num) { //@RequestParam("가져올 데이터 이름")[데이터타입][가져온데이터를 담을 변수]
		nService.delete(notice_num);
		return "redirect:/notice/notice_board";
	}

}
