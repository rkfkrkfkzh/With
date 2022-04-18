package com.example.with.alram;

import java.util.Date;

public class Alram {
	private int alram_num;
	private String member_id;
	private int product_num;
	private int alram_type; // type - 1: 판매글에 댓글등록 2: 내가 쓴 댓글에 댓글 등록 3: 관심글 상태변경
	private int alram_count;
	private Date alram_add_date;
	private String alram_href;
	private int alram_read; // read - 1: 읽지 않음 2: 읽음
	private String stringDate;

	public Alram() {
		super();
	}

	public Alram(int alram_num, String member_id, int product_num, int alram_type, int alram_count, Date alram_add_date,
			String alram_href, int alram_read, String stringDate) {
		super();
		this.alram_num = alram_num;
		this.member_id = member_id;
		this.product_num = product_num;
		this.alram_type = alram_type;
		this.alram_count = alram_count;
		this.alram_add_date = alram_add_date;
		this.alram_href = alram_href;
		this.alram_read = alram_read;
		this.stringDate = stringDate;
	}

	public int getAlram_num() {
		return alram_num;
	}

	public void setAlram_num(int alram_num) {
		this.alram_num = alram_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getAlram_type() {
		return alram_type;
	}

	public void setAlram_type(int alram_type) {
		this.alram_type = alram_type;
	}

	public int getAlram_count() {
		return alram_count;
	}

	public void setAlram_count(int alram_count) {
		this.alram_count = alram_count;
	}

	public Date getAlram_add_date() {
		return alram_add_date;
	}

	public void setAlram_add_date(Date alram_add_date) {
		this.alram_add_date = alram_add_date;
	}

	public String getAlram_href() {
		return alram_href;
	}

	public void setAlram_href(String alram_href) {
		this.alram_href = alram_href;
	}

	public int getAlram_read() {
		return alram_read;
	}

	public void setAlram_read(int alram_read) {
		this.alram_read = alram_read;
	}

	public String getStringDate() {
		return stringDate;
	}

	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}

	@Override
	public String toString() {
		return "Alram [alram_num=" + alram_num + ", member_id=" + member_id + ", product_num=" + product_num
				+ ", alram_type=" + alram_type + ", alram_count=" + alram_count + ", alram_add_date=" + alram_add_date
				+ ", alram_href=" + alram_href + ", alram_read=" + alram_read + ", stringDate=" + stringDate + "]";
	}

}
