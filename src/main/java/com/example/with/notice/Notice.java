package com.example.with.notice;


import java.sql.Date;

public class Notice {
	
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int display_num;

	public int getDisplay_num() {
		return display_num;
	}

	public void setDisplay_num(int display_num) {
		this.display_num = display_num;
	}

	public Notice() {
		super();
	}

	public Notice(String notice_title, String notice_content) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
	}

	public Notice(int notice_num, String notice_title, String notice_content, Date notice_date, int display_num) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.display_num = display_num;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	@Override
	public String toString() {
		return "Notice [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + "]";
	}
	
	
	
	
	
}