package com.example.with.review;

import java.util.Date;

public class Review {
	private int review_num;
	private String member_id;
	private String product_id;
	private int star;
	private String review_content;
	private Date review_date;

	public Review() {
		super();
	}

	public Review(int review_num, String member_id, String product_id, int star, String review_content,
			Date review_date) {
		super();
		this.review_num = review_num;
		this.member_id = member_id;
		this.product_id = product_id;
		this.star = star;
		this.review_content = review_content;
		this.review_date = review_date;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Review [review_num=" + review_num + ", member_id=" + member_id + ", product_id=" + product_id
				+ ", star=" + star + ", review_content=" + review_content + ", review_date=" + review_date + "]";
	}
}