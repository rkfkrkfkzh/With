package com.example.with.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.with.product.Product;
import com.example.with.product.ProductService;

@Controller // 컨트롤러 지정
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private ProductService pService;
// 뷰의 요청 경로 지정 요청경로("/member/idCheck")
	@RequestMapping("/member/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		Member m = service.getMember(id);
		int count = 0;
		if (m == null) {
			count = 1;
		} else {
			count = 0;
		}
		return count; // 뷰페이지 이름
	}

	@RequestMapping("/member/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		return service.getNick(nick);
	}

	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}

	@PostMapping("/member/login")
	public ModelAndView login(String id, String pwd, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ModelAndView mv = new ModelAndView("/member/loginCheck");
		HttpSession session = request.getSession();

		Member m = service.getMember(id);
		if (m != null && m.getPwd().equals(pwd)) {
			session.setAttribute("id", id); // ("변수이름",변수에넣을 데이터값)
		} else {
			mv.addObject("message", "로그인이 실패하였습니다.");
		}

		return mv;
	}
	// 뷰의 요청 경로 지정 요청경로("/member/logout")
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.removeAttribute("id");
		session.invalidate();
		return "redirect:/member/main";
	}

	@RequestMapping("member/main")
	public String main2(Model model) {
		List<Product> list = pService.getProductListByLimits(0, 8);
		model.addAttribute("list", list);
		return "index";
	}

	@GetMapping("/member/join")
	public String joinForm() {
		return "member/joinForm";
	}

	@PostMapping("/member/join")
	public String join(Member m, HttpServletRequest r) {
		if (m != null && service.getMember(m.getId()) == null) {
			service.addMember(m);
		}

		return "redirect:/member/main";
	}

	@GetMapping("member/update")
	public ModelAndView updateForm(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ModelAndView mv = new ModelAndView("member/editForm");
		Member m = service.getMember((String) session.getAttribute("id"));
		mv.addObject("m", m);
		return mv;
	}

	@PostMapping("member/update")
	public String update(Member m, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (m != null) {
			m.setId((String) session.getAttribute("id"));
			service.editMember(m);
		}

		return "redirect:/member/myPage";
	}

	@GetMapping("/member/myPage")
	public String myPage() {
		return "member/main";
	}

	@RequestMapping(value = "/member/passwordChk")
	public void pwdChk() {
	}

	@PostMapping(value = "/member/pwdChk")
	@ResponseBody
	public JSONObject pwdChk(HttpServletRequest req, @RequestParam("pwd") String pwd) {
		HttpSession session = req.getSession(false);
		JSONObject jo = new JSONObject();
		String id = (String) session.getAttribute("id");
		Member m = service.getMember(id);
		if (m.getPwd().equals(pwd)) {
			jo.put("res", "ok");

		} else {
			jo.put("res", "fail");
		}
		return jo;
	}

	@GetMapping(value = "/member/findPwd")
	public String findp(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		String id = (String) session.getAttribute("id");
		if (id != null) {
			return "redirect:/member/main";
		} else {
			return req.getRequestURI();
		}
	}

	@PostMapping(value = "/member/findPwd")
	public ModelAndView findPwd(String id) {
		ModelAndView mav = new ModelAndView();
		Member m = service.getMember(id);

		if (m == null) {
			mav.setViewName("/member/findPwd");
			mav.addObject("error", "아이디(이메일)를 확인해주세요..");
		} else if (m.getId().equals(id)) {
			mav.addObject("id", id);
			mav.setViewName("/member/changePwd");
		} else {
			mav.setViewName("/member/findPwd");
			mav.addObject("error", "입력값을 확인해주세요.");
		}

		return mav;
	}

	@GetMapping(value = "/member/changePwd")
	public void changePwdPage() {
	}

	@PostMapping(value = "/member/changePwd")
	public String changePwd(Member m) {
		service.editPwd(m);
		return "redirect:/member/login";
	}
}