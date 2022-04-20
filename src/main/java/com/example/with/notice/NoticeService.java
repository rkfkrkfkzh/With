package com.example.with.notice;

import com.example.with.member.MemberService;
import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper mapper;
    @Autowired
    private MemberService mService;

    public Integer getMaxDisplayNumber(){
        Integer maxDisplayNumber = mapper.getMaxDisplayNumber();
        if (maxDisplayNumber==null||maxDisplayNumber==0)
            return 1;
        return maxDisplayNumber+1;
    }

    public void addNotice(Notice n) {
        Integer maxDisplayNumber = getMaxDisplayNumber();
        n.setDisplay_num(maxDisplayNumber);
        mapper.insertNotice(n);// NoticeMapper insertNotice 매퍼 호출
    }

    public List selectAllNotice() {
        return mapper.selectAllNotice();
    }

    public Notice selectNoticeByNum(int notice_num) {
        return mapper.selectNotice(notice_num);
    }

    public void editNotice(Notice n) {
        mapper.updateNotice(n);
    }

    public void delete(int notice_num) {
        mapper.deleteNotice(notice_num);
        mapper.sortDisplayNumber(notice_num);

    }

    public int getNoticeListSize() {
        return mapper.selectListSize();
    }

    public Notice getNotice(int Notice_num) {
        Notice n = mapper.selectNotice(Notice_num);
        n.setNotice_content(StringEscapeUtils.escapeHtml4(n.getNotice_content()));

        return n;
    }

    private ArrayList<Notice> setNoticeData(ArrayList<Notice> list) {
        for (int i = 0; i < list.size(); i++) {
            Notice n = list.get(i);
            n.setNotice_content(StringEscapeUtils.escapeHtml4(n.getNotice_content()));
            list.set(i, n);
        }
        return list;
    }
    //제목으로 검색
    public ArrayList<Notice> getNoticeListByNotice_title(String notice_title){
        return setNoticeData(mapper.selectListByNotice_title(notice_title));
    }
    //번호로 검색
    public ArrayList<Notice> getNoticeListByNotice_num(int notice_num){
        return setNoticeData(mapper.selectListByNotice_num(notice_num));
    }
    //날짜로 검색
    public ArrayList<Notice> getNoticeListByNotice_date(Date Notice_date){
        return setNoticeData(mapper.selectListByNotice_date (Notice_date));
    }
    //전체목록 갯수단위,페이징기능
    public ArrayList<Notice> getNoticeListByLimits(int start, int last) {
        return setNoticeData(mapper.selectListByLimit(start, last));
    }

}