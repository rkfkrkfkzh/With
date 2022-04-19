package com.example.with.notice;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Mapper
public interface NoticeMapper { // @Mapper 어노테이션을 붙이면 Mapper 인터페이스로 인식합니다.

    void insertNotice(Notice n);
    // 전체 목록
    List selectAllNotice();
    // 공지 상세보기
    Notice selectNotice(int notice_num);

    void updateNotice(Notice n);

    void deleteNotice(int notice_num);

    // 제품 목록의 전체 갯수
    int selectListSize();

    // 원하는 목록 수 만큼 불러오고 페이징 기능과 연동
    ArrayList<Notice> selectListByLimit(int start, int last);
    // 공지 번호로 검색
    ArrayList<Notice> selectListByNotice_num(int notice_int);
    // 공지 제목으로 검색
    ArrayList<Notice> selectListByNotice_title(String notice_title);
    // 공지 날짜로 검색
    ArrayList<Notice> selectListByNotice_date(Date notice_date);
}
