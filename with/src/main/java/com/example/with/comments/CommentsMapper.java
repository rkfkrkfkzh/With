package com.example.with.comments;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsMapper {

	void insertComments(Comments c);

	Comments selectByCommentsNum(int comments_num);

	ArrayList<Comments> selectByProductNum(int product_num);

	ArrayList<Comments> selectByMemberId(String member_id);

	ArrayList<Comments> selectByTopCommentsNum(int top_comments_num);
		
	void updateComments(Comments c);

	void deleteComments(int comments_num);
	
	void deletedTopContent(int comments_num);
		
	//알람 구현시 필요
	int selectSeqCurrval();


}