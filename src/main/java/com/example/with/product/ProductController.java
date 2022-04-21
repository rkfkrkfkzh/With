package com.example.with.product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.with.category.CategoryService;
import com.example.with.report.ReportService;
import com.example.with.util.Page;

@Controller
public class ProductController {
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\product\\";

	@Autowired
	private ProductService pService;
	@Autowired
	private CategoryService cService;
	@Autowired
	private ReportService rService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public String index(Model model) {
		List<Product> list = pService.getProductListByLimits(0,100);
		model.addAttribute("list", list);
		return "index";
	}
	
	@GetMapping("/product/add")
	public void addForm() {
	}
	
	@PostMapping("/product/add")
	public String addProduct(Product p) {
		pService.addProduct(p);
		int product_num = pService.getProductSeqCurrval();
		uploadFile(p.getFile1(), product_num, 1);
		uploadFile(p.getFile2(), product_num, 2);
		uploadFile(p.getFile3(), product_num, 3);
		return "redirect:/product/view?product_num=" + product_num;
	}
	
	private void uploadFile(MultipartFile file, int product_num, int img_num) {
		File dir = new File(projectPath + webPath + product_num);
		if(!dir.exists()) {
			dir.mkdir();
		}
		if(!file.isEmpty()) {
			String uploadPath = webPath + product_num + "\\" + img_num + "_" + file.getOriginalFilename();
			File f = new File(projectPath + uploadPath);
			
			try {
				file.transferTo(f);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/product/list")
	public String list(Model model, @RequestParam(defaultValue = "1", required = false) int p) {
		Page page = new Page(p, pService.getProductListSize());
		page.pageInfo();
		if(p> page.getMaxPage() && page.getMaxPage() != 0) {
			return "redirect:/product/list?p=" + page.getMaxPage();
		}else {
			List<Product> list = pService.getProductListByLimits(page.getStartList(), page.getStartList() + page.getListSize());
			model.addAttribute("plist", list);
			model.addAttribute("page", page);
			return request.getContextPath() + request.getRequestURI();
		}
	}
	
	@GetMapping("/product/search")
	public String search(@RequestParam(required = false) String q, @RequestParam(required = false) String value, Model model) {
		if(q != null && value != null) {
			request.setAttribute("q", q);
			request.setAttribute("value", value);
			ArrayList<Product> list = null;
			if(q.equals("product_title")) {
				list = pService.getProductListByProduct_title(value);
			} else if(q.equals("c1")) {
				int c1 = Integer.parseInt(value);
				list = pService.getProductListByCategory1_num(c1);
			} else if(q.equals("c2")) {
				int c2 = Integer.parseInt(value);
				list = pService.getProductListByCategory1_num(c2);
			} else if(q.equals("c3")) {
				int c3 = Integer.parseInt(value);
				list = pService.getProductListByCategory1_num(c3);
			} else if (q.equals("product_nick")) {
				list = pService.getProductListByProduct_nick(value);
			} else if (q.equals("product_writer")) {
				list = pService.getProductListByListByProduct_writer(value);
			}
			model.addAttribute("plist", list);
			return "/product/list";
		}else {
			return "redirect:/product/list";
		}
	}
	
	@GetMapping("/product/search2") // 카테고리 선택 후 검색(순서고정)
	public String search2(@RequestParam(required = false, defaultValue = "") String q,
			@RequestParam(required = false, defaultValue = "") String value,
			@RequestParam(required = false) String c_name, @RequestParam(required = false) String c_num, Model model) {
		int category_num = Integer.parseInt(c_num);
		ArrayList<Product> list = null;
		Product p = new Product();

		if (q.equals("product_title")) {
			p.setProduct_title(value);
			p.setProduct_nick("");

		} else if (q.equals("product_nick")) {
			p.setProduct_nick(value);
			p.setProduct_title("");
		}

		if (c_name.equals("c1")) {
			p.setCategory1_num(category_num);
			list = pService.selectByCategory1AndNickORTitle(p);
		} else if (c_name.equals("c2")) {
			p.setCategory2_num(category_num);
			list = pService.selectByCategory2AndNickORTitle(p);
			request.setAttribute("cate", cService.getCategory(2, category_num));
		}

		request.setAttribute("c_name", c_name);
		request.setAttribute("c_num", c_num);
		request.setAttribute("checkNum", 1);
		
		model.addAttribute("plist", list);
		return "/product/list";
	}
	
	@RequestMapping("/product/mylist")
	public String myProductList(Model model) {
		String user_id = (String) session.getAttribute("id");
		ArrayList<Product> list = pService.getProductListByListByProduct_writer(user_id);
		if(user_id != null) {
			model.addAttribute("plist", list);
			return "/product/mylist";
		}else {
			return "redirect:/member/loginForm";
		}
	}
	
	@RequestMapping("product/view")
	public void viewProduct(@RequestParam int product_num, Model model) {
		pService.editProductHit(product_num);
		Product p = pService.getProduct(product_num);
		int i = rService.reportCount(p.getProduct_writer());
		model.addAttribute("p", p);
		model.addAttribute("i", i);
	}
	
	@RequestMapping("/product/delete")
	private String deleteProduct(@RequestParam int product_num) {
		String user_id = (String) session.getAttribute("id");
		System.out.println(user_id);
		int user_type = (int) session.getAttribute("type");
		Product p = pService.getProduct(product_num);
		if(user_id.equals(p.getProduct_writer()) || user_type == 2) {
			pService.deleteProduct(product_num);
			return "redirect:/product/list";
		}else{
			return "redirect:/member/login";
		}
	}
	
	//거래 예약하기
	@RequestMapping("/product/ordercancel")
	public String orderCancelProduct(int product_num) {
		System.out.println(product_num);
		Product p = pService.getProduct(product_num);
		String user_id = (String)session.getAttribute("id");
		if(user_id.equals(p.getProduct_writer())) {
			pService.editProductType(product_num, 0, null);
		}
		return "redirect:/product/view?product_num=" + (int)product_num;
	}
	
//	거래 예약
	@RequestMapping("/product/order")
	public String orderProduct(int product_num) {
		Product p = pService.getProduct(product_num);
		String user_id = (String) session.getAttribute("id");
		if (user_id.equals(p.getProduct_writer())) {
//			예약중일때 1
			pService.editProductType(product_num, 1, null);
		}
		return "redirect:/product/view?product_num=" + product_num;
	}
	
	@RequestMapping("/product/soldout")
	public String slodOutProduct(int product_num, @RequestParam(required = false, value = "member_id") String member_id) {
		Product p = pService.getProduct(product_num);
		String user_id = (String) session.getAttribute("id");
		if(user_id.equals(p.getProduct_writer())) {
			pService.editProductType(product_num, 2, member_id);
		}
		return "redirect:/product/view?product_num=" + (int)product_num;
	}
	
	public ArrayList<Product> subList(Page page, ArrayList<Product> list){
		if(page.getCurrentPage() == page.getMaxPage()) {
			return new ArrayList<Product>(list.subList(page.getStartList(), page.getListCnt()));
		}else {
			return new ArrayList<Product>(list.subList(page.getStartList(), page.getStartList() + page.getListSize()));
		}
	}
}
