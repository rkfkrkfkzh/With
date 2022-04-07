package com.example.with.product;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.example.with.category.Category;
import com.example.with.comments.Comments;
import com.example.with.member.Member;

public class Product {

	private int product_num;
	private String product_title;
	private int product_price;
	private String product_content;
	private String product_nick;
	private int category1_num, category2_num, category3_num;
	private String product_writer;
	private Date product_add_date;
	private String stringDate;
	private int product_hit, product_type;
	private int product_tradetype;
	private MultipartFile file1, file2, file3;
	private String path1, path2, path3;
	private Member member;
	private Category c1, c2, c3;
	private ArrayList<Comments> comments;
	
	public Product() {
		super();
	}

	public Product(int product_num, String product_title, int product_price, String product_content,
			String product_nick, int category1_num, int category2_num, int category3_num, String product_writer,
			Date product_add_date, String stringDate, int product_hit, int product_type, int product_tradetype,
			MultipartFile file1, MultipartFile file2, MultipartFile file3, String path1, String path2, String path3,
			Member member, Category c1, Category c2, Category c3, ArrayList<Comments> comments) {
		super();
		this.product_num = product_num;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_nick = product_nick;
		this.category1_num = category1_num;
		this.category2_num = category2_num;
		this.category3_num = category3_num;
		this.product_writer = product_writer;
		this.product_add_date = product_add_date;
		this.stringDate = stringDate;
		this.product_hit = product_hit;
		this.product_type = product_type;
		this.product_tradetype = product_tradetype;
		this.file1 = file1;
		this.file2 = file2;
		this.file3 = file3;
		this.path1 = path1;
		this.path2 = path2;
		this.path3 = path3;
		this.member = member;
		this.c1 = c1;
		this.c2 = c2;
		this.c3 = c3;
		this.comments = comments;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_nick() {
		return product_nick;
	}

	public void setProduct_nick(String product_nick) {
		this.product_nick = product_nick;
	}

	public int getCategory1_num() {
		return category1_num;
	}

	public void setCategory1_num(int category1_num) {
		this.category1_num = category1_num;
	}

	public int getCategory2_num() {
		return category2_num;
	}

	public void setCategory2_num(int category2_num) {
		this.category2_num = category2_num;
	}

	public int getCategory3_num() {
		return category3_num;
	}

	public void setCategory3_num(int category3_num) {
		this.category3_num = category3_num;
	}

	public String getProduct_writer() {
		return product_writer;
	}

	public void setProduct_writer(String product_writer) {
		this.product_writer = product_writer;
	}

	public Date getProduct_add_date() {
		return product_add_date;
	}

	public void setProduct_add_date(Date product_add_date) {
		this.product_add_date = product_add_date;
	}

	public String getStringDate() {
		return stringDate;
	}

	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}

	public int getProduct_hit() {
		return product_hit;
	}

	public void setProduct_hit(int product_hit) {
		this.product_hit = product_hit;
	}

	public int getProduct_type() {
		return product_type;
	}

	public void setProduct_type(int product_type) {
		this.product_type = product_type;
	}

	public int getProduct_tradetype() {
		return product_tradetype;
	}

	public void setProduct_tradetype(int product_tradetype) {
		this.product_tradetype = product_tradetype;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	public MultipartFile getFile2() {
		return file2;
	}

	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile3() {
		return file3;
	}

	public void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}

	public String getPath1() {
		return path1;
	}

	public void setPath1(String path1) {
		this.path1 = path1;
	}

	public String getPath2() {
		return path2;
	}

	public void setPath2(String path2) {
		this.path2 = path2;
	}

	public String getPath3() {
		return path3;
	}

	public void setPath3(String path3) {
		this.path3 = path3;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Category getC1() {
		return c1;
	}

	public void setC1(Category c1) {
		this.c1 = c1;
	}

	public Category getC2() {
		return c2;
	}

	public void setC2(Category c2) {
		this.c2 = c2;
	}

	public Category getC3() {
		return c3;
	}

	public void setC3(Category c3) {
		this.c3 = c3;
	}

	public ArrayList<Comments> getComments() {
		return comments;
	}

	public void setComments(ArrayList<Comments> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Product [product_num=" + product_num + ", product_title=" + product_title + ", product_price="
				+ product_price + ", product_content=" + product_content + ", product_nick=" + product_nick
				+ ", category1_num=" + category1_num + ", category2_num=" + category2_num + ", category3_num="
				+ category3_num + ", product_writer=" + product_writer + ", product_add_date=" + product_add_date
				+ ", stringDate=" + stringDate + ", product_hit=" + product_hit + ", product_type=" + product_type
				+ ", product_tradetype=" + product_tradetype + ", file1=" + file1 + ", file2=" + file2 + ", file3="
				+ file3 + ", path1=" + path1 + ", path2=" + path2 + ", path3=" + path3 + ", member=" + member + ", c1="
				+ c1 + ", c2=" + c2 + ", c3=" + c3 + ", comments=" + comments + "]";
	}
	
	


}