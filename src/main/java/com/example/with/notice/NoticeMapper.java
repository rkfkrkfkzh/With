package com.example.with.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper { // @Mapper 어노테이션을 붙이면 Mapper 인터페이스로 인식합니다.

	void insertNotice(Notice n);

	List selectAllNotice();

	Notice selectNotice(int notice_num);

	void updateNotice(Notice n);

	void deleteNotice(int notice_num);

}
