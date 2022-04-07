package com.example.with.comments;

import java.sql.Date;
import java.util.ArrayList;

import com.example.with.member.Member;

public class Comments {

	private int comments_num;
	private int product_num;
	private String member_id;
	private Date comments_date;
	private String comments_content;
	private int top_comments_num;
	private ArrayList<Comments> child_comments;
	private Member member;

	public Comments() {
	}

	public Comments(int comments_num, int product_num, String member_id, Date comments_date, String comments_content,
			int top_comments_num, ArrayList<Comments> child_comments, Member member) {
		super();
		this.comments_num = comments_num;
		this.product_num = product_num;
		this.member_id = member_id;
		this.comments_date = comments_date;
		this.comments_content = comments_content;
		this.top_comments_num = top_comments_num;
		this.child_comments = child_comments;
		this.member = member;
	}

	public int getComments_num() {
		return comments_num;
	}

	public void setComments_num(int comments_num) {
		this.comments_num = comments_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getComments_date() {
		return comments_date;
	}

	public void setComments_date(Date comments_date) {
		this.comments_date = comments_date;
	}

	public String getComments_content() {
		return comments_content;
	}

	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}

	public int getTop_comments_num() {
		return top_comments_num;
	}

	public void setTop_comments_num(int top_comments_num) {
		this.top_comments_num = top_comments_num;
	}

	public ArrayList<Comments> getChild_comments() {
		return child_comments;
	}

	public void setChild_comments(ArrayList<Comments> child_comments) {
		this.child_comments = child_comments;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Comments [comments_num=" + comments_num + ", product_num=" + product_num + ", member_id=" + member_id
				+ ", comments_date=" + comments_date + ", comments_content=" + comments_content + ", top_comments_num="
				+ top_comments_num + ", child_comments=" + child_comments + ", member=" + member + "]";
	}

}