package com.example.with.review;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
	@Autowired
	private ReviewMapper mapper;
	
	public void addReview(Review r) {
		mapper.insert(r);
		mapper.update(r);
	}
	
	public ArrayList<Review> getAllList(String id) {
		return mapper.selectById(id);
	}
	
	public void delReview(Review r) {
		mapper.delete(r.getReview_num());
		mapper.updateDel(r);
	}
}