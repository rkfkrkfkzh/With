package com.example.with.notice;

import com.example.with.product.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface NoticeMapper { // @Mapper 어노테이션을 붙이면 Mapper 인터페이스로 인식합니다.

    void insertNotice(Notice n);

    List selectAllNotice();

    Notice selectNotice(int notice_num);

    void updateNotice(Notice n);

    void deleteNotice(int notice_num);

    // 제품 목록의 전체 갯수
    int selectListSize();

    // 원하는 목록 수 만큼 불러오고 페이징 기능과 연동
    ArrayList<Notice> selectListByLimit(int start, int last);
}
