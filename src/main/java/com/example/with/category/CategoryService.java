package com.example.with.category;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

	@Autowired
	private CategoryMapper mapper;

	public void addCategory(Category c, int category_type) {
		switch (category_type) {
		case 1:
			mapper.insertCategory1(c);
			break;
		case 2:
			mapper.insertCategory2(c);
			break;
		case 3:
			mapper.insertCategory3(c);
			break;
		}
	}

	public Category getCategory(int category_type, int category_num) {
		Category cate = null;
		switch (category_type) {
		case 1:
			cate = mapper.selectCategory1(category_num);
			break;
		case 2:
			cate = mapper.selectCategory2(category_num);
			break;
		case 3:
			cate = mapper.selectCategory3(category_num);
			break;
		}
		return cate;
	}

	public ArrayList<Category> getAllCategory(int category_type, int parent_category_num) {
		ArrayList<Category> list = null;
		switch (category_type) {
		case 1:
			list = mapper.selectAllCategory1();
			break;
		case 2:
			list = mapper.selectAllCategory2(parent_category_num);
			break;
		case 3:
			list = mapper.selectAllCategory3(parent_category_num);
			break;
		}
		return list;
	}

	public void delCategory(int category_type, int category_num) {
		switch (category_type) {
		case 1:
			mapper.deleteCategory1(category_num);
			break;
		case 2:
			mapper.deleteCategory2(category_num);
			break;
		case 3:
			mapper.deleteCategory3(category_num);
			break;
		}
	}

}
