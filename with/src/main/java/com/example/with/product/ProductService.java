package com.example.with.product;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.with.alram.Alram;
import com.example.with.alram.AlramService;
import com.example.with.category.CategoryService;
import com.example.with.comments.CommentsService;
import com.example.with.member.MemberService;
import com.example.with.util.CalcDate;
import com.example.with.wish.Wish;
import com.example.with.wish.WishService;

@Service
public class ProductService {
	private String projectPath = new File("").getAbsolutePath().toString() + "\\src\\main\\webapp";
	private String webPath = "\\static\\product\\";
	
	@Autowired
	private ProductMapper mapper;
	@Autowired
	private WishService wService;
	@Autowired
	private MemberService mService;
	@Autowired
	private CategoryService cService;
	@Autowired
	private CommentsService coService;
	@Autowired
	private AlramService aService;
	
	public void addProduct(Product p) {
		mapper.insert(p);
	}
	
	public int getProductListSize() {
		return mapper.selectListSize();
	}
	
	public Product getProduct(int product_num) {
		Product p = mapper.select(product_num);
		p = productSetPath(p);
		p.setProduct_content(StringEscapeUtils.escapeHtml4(p.getProduct_content()));
		p.setMember(mService.getMember(p.getProduct_writer()));
		p.setComments(coService.getCommentsByProductNum(product_num));
		p.setC1(cService.getCategory(1, p.getCategory1_num()));
		p.setC2(cService.getCategory(2, p.getCategory2_num()));
		p.setC3(cService.getCategory(3, p.getCategory3_num()));
		p.setStringDate(CalcDate.txtDate(p.getProduct_add_date()));
		return p;
	}
	
	private ArrayList<Product> setProductData(ArrayList<Product> list){
		for(int i = 0; i < list.size(); i++) {
			Product p = list.get(i);
			p = productSetPath(p);
			p.setProduct_content(StringEscapeUtils.escapeHtml4(p.getProduct_content()));
			p.setMember(mService.getMember(p.getProduct_writer()));
			p.setComments(coService.getCommentsByProductNum(p.getProduct_num()));
			p.setC1(cService.getCategory(1, p.getCategory1_num()));
			p.setC2(cService.getCategory(2, p.getCategory2_num()));
			p.setC3(cService.getCategory(3, p.getCategory3_num()));
			p.setStringDate(CalcDate.txtDate(p.getProduct_add_date()));
			list.set(i, p);
		}
		return list;
	}
	
	//전체 목록
	private ArrayList<Product> getProductList(){
		return setProductData(mapper.selectList());
	}
	
	
	//전체목록 갯수단위,페이징기능
	public ArrayList<Product> getProductListByLimits(int start, int last){
		return setProductData(mapper.selectListByLimit(start, last));
	}
	
	//제품명으로 검색
	public ArrayList<Product> getProductListByProduct_title(String product_title){
		return setProductData(mapper.selectListByProduct_title(product_title));
	}
	
	//판매자로 검색
	public ArrayList<Product> getProductListByListByProduct_writer(String product_writer){
		return setProductData(mapper.selectListByProduct_writer(product_writer));
	}
	
	public ArrayList<Product> getProductListByProduct_nick(String product_nick){
		return setProductData(mapper.selectListByProduct_nick(product_nick));
	}
	
	//카테고리별 검색
	//대분류
	public ArrayList<Product> getProductListByCategory1_num(int category1_num){
		return setProductData(mapper.selectListByCategory1_num(category1_num));
	}
	
	//중분류
	public ArrayList<Product> getProductListByCategory2_num(int category2_num){
		return setProductData(mapper.selectListByCategory1_num(category2_num));
	}
	
	//소분류
	public ArrayList<Product> getProductListByCategory3_num(int category3_num){
		return setProductData(mapper.selectListByCategory1_num(category3_num));
	}
	
	//상품 수정
	public void editProduct(Product p) {
		mapper.update(p);
	}
	
	//조회수+
	public void editProductHit(int product_num) {
		mapper.updateHit(product_num);
	}
	
	
	//거래중 타입
	public void editProductType(int product_num, int product_type, String buyer_id) {
		Alram a = new Alram();
		@SuppressWarnings("unchecked")
		ArrayList<Wish> list = (ArrayList<Wish>) wService.selectByProductNum(product_num);
		for (int i = 0; i < list.size(); i++) {
			Wish w = list.get(i);
			a.setMember_id(w.getMember_id());
			a.setProduct_num(product_num);
			a.setAlram_type(product_type + 3);
			a.setAlram_count(1);
			a.setAlram_href("/product/view?product_num=" + product_num);
//			예약상태 취소 : type == 0
//			예약상태로 변경 : type == 1
			a.setAlram_read(0);
			if (product_type != 2) {
				aService.addAlram(a);
			}
		}
		if (buyer_id != null && product_type == 2) {
//			거래 완료상태 : type == 2
			a.setMember_id(buyer_id);
			a.setProduct_num(product_num);
			a.setAlram_type(product_type + 3);
			a.setAlram_count(1);
			a.setAlram_href("/product/view?product_num=" + product_num);
			aService.addAlram(a);
		}
		mapper.updateType(product_num, product_type);
	}
	
	//제품 삭제
	public void deleteProduct(int product_num) {
		mapper.delete(product_num);
	}
	
	//제품 시퀀스 번호
	public int getProductSeqCurrval() {
		return mapper.selectSeqCurrval();
	}
	
	//제품위치의 이미지 목록 가져옴
	private String[] getFileList(int product_num) {
		File dir = new File(projectPath + webPath + product_num);
		String[] files = dir.list();
		if (files != null) {
			for(int i = 0; i < files.length; i++) {
				files[i] = webPath.replace("\\", "/") + product_num + "/" + files[i];
			}
		}else {
			files = new String[1];
			files[0] = "";
		}
		return files;
	}
	
	//제품 이미지 넣기
	private Product productSetPath(Product p) {
		String[] files = getFileList(p.getProduct_num());
		if(files.length >= 1 && !files[0].equals("")) {
			p.setPath1(files[0]);
			if(files.length >= 2) {
				p.setPath2(files[1]);
				if(files.length >= 3) {
					p.setPath3(files[2]);
				}
			}
		}else {
			p.setPath1("http://dummyimage.com/286.com/286x150/fff/000.png&text=No+Image");
		}
		return p;
	}
	// category1 and (nick or name) search
	public ArrayList<Product> selectByCategory1AndNickORTitle(Product p) {
		return setProductData(mapper.selectByCategory1AndNickORTitle(p));
	}

	// category2 and (nick or name) search
	public ArrayList<Product> selectByCategory2AndNickORTitle(Product p) {
		return setProductData(mapper.selectByCategory2AndNickORTitle(p));
	}
}
