package com.example.with.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.with.member.Member;
import com.example.with.member.MemberService;
import com.example.with.product.ProductService;

@Controller
public class APIController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private ProductService pService;
	
	
	@Autowired
	private HttpSession session;

	@RequestMapping("/api/product/getTitle")
	@ResponseBody
	public String getProductTitle(@RequestParam int product_num) {
		return pService.getProduct(product_num).getProduct_title();
	}
	
	@RequestMapping("/api/member/getProductWriterByProductNum")
	@ResponseBody
	public String getProductWriterByProductNum(@RequestParam int product_num) {
		return pService.getProduct(product_num).getProduct_writer();
	}

	@RequestMapping("/api/member/getUserType")
	@ResponseBody
	public int getUserType() {
		String id = (String) session.getAttribute("id");
		if (id != null) {
			return mService.getMember(id).getType();
		} else {
			return -1;
		}
	}
}
