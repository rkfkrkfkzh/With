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

@Controller
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
		String id = (String) session.getAttribute("id");
		if (id != null) {
			Member m = mService.getMember(id);
			if (m.getType() == 2) {
				nService.addNotice(n);
				path = "redirect:/notice/notice_board";
			}
		}
		return path;
	}
	
	@RequestMapping(value = "/notice/notice_contentView")
	public ModelAndView content(@RequestParam(value = "notice_num") int notice_num) {
		ModelAndView mav = new ModelAndView("/notice/notice_contentView");
		Notice n = nService.selectNoticeByNum(notice_num);
		mav.addObject("n", n);
		return mav;

	}

	@RequestMapping(value = "/notice/notice_board")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/notice/notice_board");
		ArrayList<Notice> list = (ArrayList<Notice>) nService.selectAllNotice();
		String id = (String)session.getAttribute("id");
		Member m = mService.getMember(id);
		int type = m.getType();
		session.setAttribute("type", type);
		System.out.println(list);
		Collections.reverse(list);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping(value = "/notice/notice_edit")
	public String edit(Notice n) {
		nService.editNotice(n);
		return "redirect:/notice/notice_board";
	}

	@RequestMapping(value = "/notice/notice_delete")
	public String delete(@RequestParam(value = "notice_num") int notice_num) {
		nService.delete(notice_num);
		return "redirect:/notice/notice_board";
	}

}
