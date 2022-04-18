package com.example.with.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	// 제품 등록
	void insert(Product p);

	// 제품 목록의 전체 갯수
	int selectListSize();

	// 제품 상세보기
	Product select(int product_num);

	// 전체 목록
	ArrayList<Product> selectList();

	// 원하는 목록 수 만큼 불러오고 페이징 기능과 연동
	ArrayList<Product> selectListByLimit(int start, int last);

	// 제품 이름으로 검색
	ArrayList<Product> selectListByProduct_title(String product_title);

	// 제품 카테고리별 검색
	// 대분류
	ArrayList<Product> selectListByCategory1_num(int category1_num);

	// 중분류
	ArrayList<Product> selectListByCategory2_num(int category2_num);

	// 소분류
	ArrayList<Product> selectListByCategory3_num(int category3_num);

	// 제품 게시글 등록자로 검색
	ArrayList<Product> selectListByProduct_writer(String product_writer);
	
	//제품 작성자 닉네임으로 검색
	ArrayList<Product> selectListByProduct_nick(String product_nick);

	// 상세보기 내용수정
	void update(Product p);

	// 조회수
	void updateHit(int product_num);

	// 제품 거래타입
	void updateType(int product_num, int product_type);

	// 제품 삭제
	void delete(int product_num);

	// 시퀀스 값 가져오기.
	int selectSeqCurrval();
	
	// category1값과 nick or name 값 검색
	ArrayList<Product> selectByCategory1AndNickORTitle(Product p);

	// category2값과 nick or name 값 검색
	ArrayList<Product> selectByCategory2AndNickORTitle(Product p);
}
