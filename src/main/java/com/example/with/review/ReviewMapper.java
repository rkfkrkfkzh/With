package com.example.with.review;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {
	void insert(Review r);
	ArrayList<Review> selectById(String id);
	void delete(int review_num);
	void update(Review r);
	void updateDel(Review r);
}