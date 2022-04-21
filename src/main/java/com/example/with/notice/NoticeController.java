package com.example.with.notice;

import com.example.with.member.Member;
import com.example.with.member.MemberService;
import com.example.with.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Controller //해당 클래스 컨트롤러로 동작
public class NoticeController {

    @Autowired
    private NoticeService nService;
    @Autowired
    private MemberService mService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;  //HttpSession을 주입받는다고 선언하는 것만으로는 Servlet Container에게 Session을 달라고 요청하지 않습니다.
    //setAttribute 혹은 getAttribute 같은 api를 호출하는 시점에 요청/생성합니다.


    @GetMapping(value = "/notice/notice_writing") // "notice/notice_writing" 요청이 들어오면 아래의 함수를 실행
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
    public String list(Model model, @RequestParam(defaultValue = "1", required = false) int p) {
        Page page = new Page(p, nService.getNoticeListSize());
        page.pageInfo();
        String id = (String) session.getAttribute("id");
        Member m = mService.getMember(id);
        int type = m.getType();
        session.setAttribute("type", type);
        if (p > page.getMaxPage() && page.getMaxPage() != 0) {
            return "redirect:/notice/notice_board?p=" + page.getMaxPage();
        } else {
            List<Notice> list = nService.getNoticeListByLimits(page.getStartList(), page.getStartList() + page.getListSize());
            model.addAttribute("list", list);
            model.addAttribute("page", page);
            return request.getContextPath() + request.getRequestURI();
        }

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

    @GetMapping("/notice/search")
    public String search(@RequestParam(required = false) String q, @RequestParam(required = false) String value, Model model) {
        if (q != null && value != null) {
            request.setAttribute("q", q);
            request.setAttribute("value", value);
            ArrayList<Notice> list = null;
            try {
                if (q.equals("notice_title")) {
                    list = nService.getNoticeListByNotice_title(value);
                } else if (q.equals("notice_num")) {
                    int notice_num = Integer.parseInt(value);
                    list = nService.getNoticeListByNotice_num(notice_num);
                } else if (q.equals("notice_date")) {
                    Date notice_date = Date.valueOf(value);
                    list = nService.getNoticeListByNotice_date(notice_date);
                } else if (q.equals("display_num")) {
                    int display_num = Integer.parseInt(value);
                    list = nService.getNoticeListByDisplay_num(display_num);
                }
            } catch (IllegalArgumentException e) {  //illegalargumentexception에 numberformatexception 포함되며 RuntimeException이다
                System.out.println(e);
            }
            model.addAttribute("list", list);
            return "/notice/notice_board";
        } else {
            return "redirect:/notice/notice_board";
        }
    }

    public ArrayList<Notice> subList(Page page, ArrayList<Notice> list) {
        if (page.getCurrentPage() == page.getMaxPage()) {
            return new ArrayList<Notice>(list.subList(page.getStartList(), page.getListCnt()));
        } else {
            return new ArrayList<Notice>(list.subList(page.getStartList(), page.getStartList() + page.getListSize()));
        }
    }
}
