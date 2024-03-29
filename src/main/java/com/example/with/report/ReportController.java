package com.example.with.report;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.with.product.Product;
import com.example.with.product.ProductService;

@Controller
public class ReportController {

	@Autowired
	private ReportService rService;
	@Autowired
	private ProductService pService;

	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/report/reportForm")
	public void reportForm(@RequestParam int product_num, Model model) {
		model.addAttribute("product_num", product_num);
	}

	@PostMapping(value = "/report/add")
	public String insertReport(Report r) {
		String writer_id = (String) session.getAttribute("id");
		Product p = pService.getProduct(r.getProduct_num());
		String pId = p.getProduct_writer();
		System.out.println(writer_id);
		System.out.println(p);
		System.out.println(pId);
		r.setReport_writer_id(writer_id);
		r.setReport_user_id(pId);
		rService.insertReport(r);
		return "redirect:/product/view?product_num=" + r.getProduct_num();
	}

	@RequestMapping(value = "/report/reportList")
	// admin계정에서 보이는 신고접수된list
	public String reportList(Model model) {
		String writer_id = (String) session.getAttribute("id");
		if (writer_id != null) {
			ArrayList<Report> list = (ArrayList<Report>) rService.selectAll();
			model.addAttribute("list", list);
		}
		return "/report/reportList";
	}

	@RequestMapping(value = "/report/reportValue")
	public ModelAndView reportValue(int report_num) {
		ModelAndView mav = new ModelAndView("report/reportValue");
		String user_id = (String) session.getAttribute("product_writer");
		Report r = rService.getReport(report_num);
		mav.addObject("r", r);
		return mav;
	}

//	@RequestMapping(value = "/report/value")
//	public void value(Report r) {
//		rService.fakeEdit(r);
//	}

	@RequestMapping(value = "/report/delete")
	public void delete(int report_num) {
		rService.delReport(report_num);
	}

}
