package com.example.with.alram;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.with.util.CalcDate;
import com.google.gson.Gson;

@Controller
public class AlramController {
	@Autowired
	private AlramService aService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/alram/mylist")
	public void myList(Model model) {
		String member_id = (String) session.getAttribute("id");
		ArrayList<Alram> aList = aService.getAlramListByMember_id(member_id);
		for(int i = 0; i < aList.size(); i++) {
			Alram a = aList.get(i);
			a.setStringDate(CalcDate.txtDate(a.getAlram_add_date()));
		}
		model.addAttribute("aList", aList);
	}
	
	@RequestMapping("/alram/getsize")
	@ResponseBody
	public int getAlramSize() {
		String member_id = (String) session.getAttribute("id");
		if(member_id != null) {
			return aService.getAlramUnreadListByMember_id(member_id).size();
		}else {
			return -1;
		}
	}
	
	@RequestMapping("/alram/read")
	@ResponseBody
	public String readAlram(@RequestParam int alram_num) {
		System.out.println("read");
		aService.editAlramRead(alram_num);
		Gson g = new Gson();
		return g.toJson("ok");
	}
	
	@RequestMapping("/alram/delete")
	@ResponseBody
	public String deleteAlram(@RequestParam int alram_num) {
		System.out.println("alram : " + alram_num);
		aService.deleteAlram(alram_num);
		return "success";
	}
	
	@RequestMapping("/alram/deleteall")
	@ResponseBody
	public String deleteAlram() {
		String member_id = (String) session.getAttribute("id");
		if(member_id != null) {
			aService.deleteAlramByMember_id(member_id);
		}
		return "success";
	}
}
