package com.example.with.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishService {
	
	 @Autowired
	   private WishMapper mapper;
	   
	   public void insertWish(Wish w) {
	      mapper.insertWish(w);
	   }
	   
	   public List selectByMemberId(String member_id) {
	      return mapper.selectByMemberId(member_id);
	   }
	   
	   public List selectByProductNum(int product_num) {
	      return mapper.selectByProductNum(product_num);
	   }
	   
	   public void deleteWish(int wish_num) {
	      mapper.deleteWish(wish_num);
	   }
	   
	   public void deleteAllwish(String member_id) {
	      mapper.deleteAllWish(member_id);
	   }
	   
	   public void deleteWishByProductNum(int product_num , String member_id) {
	      mapper.deleteWishByProductNum(member_id, product_num);
	   }
	   
	   public Wish selectByMemberIdProductNum(int product_num, String member_id) {
	      return mapper.selectByMemberIdProductNum(product_num, member_id);
	   }
	   
	   public int getNum() {
	      return mapper.getNum();
	   }


}
