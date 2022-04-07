package com.example.with.member;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String addr;
	private String nick;
	private int type;
	private double rate;
	private int rateCount;

	public Member() {
		super();
	}

	public Member(String id, String pwd, String name, String tel, String addr, String nick, int type, double rate,
			int rateCount) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.nick = nick;
		this.type = type;
		this.rate = rate;
		this.rateCount = rateCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getRateCount() {
		return rateCount;
	}

	public void setRateCount(int rateCount) {
		this.rateCount = rateCount;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel + ", addr=" + addr + ", nick="
				+ nick + ", type=" + type + ", rate=" + rate + ", rateCount=" + rateCount + "]";
	}

}