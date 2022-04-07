package com.example.with.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;

	public void addMember(Member m) {
		mapper.insert(m);
	}

	public Member getMember(String id) {
		return mapper.selectById(id);
	}

	public int getNick(String nick) {
		return mapper.selectNick(nick);
	}

	public List getAllMember() {
		return mapper.select();
	}

	public void editMember(Member m) {
		mapper.update(m);
	}

	public void editPwd(Member m) {
		mapper.updatePwd(m.getId(), m.getPwd());
	}

	public void delMember(String id) {
		mapper.delete(id);
	}
}