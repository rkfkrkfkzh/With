package com.example.with.member;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	void insert(Member m);

	ArrayList<Member> select(); // ����� ��ü ���(������)

	Member selectById(String id);

	int selectNick(String nick);

	void update(Member m);

	void delete(String id);

	void updatePwd(String id, String pwd);
}