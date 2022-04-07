package com.example.with.alram;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AlramMapper {
	void insert(Alram r);
	
	Alram select(int alram_num);
	
	ArrayList<Alram> selectListByMember_id(String member_id);
	
	ArrayList<Alram> selectUnreadListByMember_id(String member_id);
	
	Alram selectByAlram(Alram a);
	
	void updateAlramCount(int alram_num);
	
	void updateAlramRead(int alram_num);
	
	void updateAlram(Alram a);
	
	void delete(int alram_num);
	
	void deleteByMember_id(String member_id);
}
