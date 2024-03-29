package com.example.with.category;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	// 카테고리 입력
	void insertCategory1(Category c);
	void insertCategory2(Category c);
	void insertCategory3(Category c);

	// 카테고리 출력
	Category selectCategory1(int category_num);
	Category selectCategory2(int category_num);
	Category selectCategory3(int category_num);

	// 카테고리 출력
	ArrayList<Category> selectAllCategory1();
	ArrayList<Category> selectAllCategory2(int parent_category_num);
	ArrayList<Category> selectAllCategory3(int parent_category_num);

	// 카테고리 삭제
	void deleteCategory1(int category_num);
	void deleteCategory2(int category_num);
	void deleteCategory3(int category_num);

}
