package com.example.with.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	
	void insertReport(Report r);
	
	List selectAll();
	
	Report select(int report_num);
	
	int selectCount(String report_user_id);

	void delete(int report_num);
}
