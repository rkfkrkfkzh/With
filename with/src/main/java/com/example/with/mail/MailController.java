package com.example.with.mail;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.with.alram.AlramService;

@Controller
public class MailController {
	@Autowired 
	MailService mailService;

	@Autowired
	private AlramService aSerivce;
	
	@RequestMapping("/mail/mailSend")
	public String mailSend(@RequestParam("product_num") int product_num) {
		mailService.sendMail(product_num);
		aSerivce.addAlramByTrade(product_num);
		return "redirect:/product/list";
	}
}
