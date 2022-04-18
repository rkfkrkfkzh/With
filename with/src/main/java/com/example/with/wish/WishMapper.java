package com.example.with.wish;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishMapper {
	

	   void insertWish(Wish w);

	   @SuppressWarnings("rawtypes")
	   List selectWishNum(int wish_num);

	   @SuppressWarnings("rawtypes")
	   List selectByMemberId(String member_id);

	   @SuppressWarnings("rawtypes")
	   List selectByProductNum(int product_num);

	   Wish selectByMemberIdProductNum(int product_num, String member_id);

	   void deleteWish(int wish_num);

	   void deleteAllWish(String member_id);

	   void deleteWishByProductNum(String member_id, int product_num);

	   int getNum();


}
