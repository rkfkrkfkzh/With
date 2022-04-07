package com.example.with.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	public void addNotice(Notice n) {
		mapper.insertNotice(n); // NoticeMapper insertNotice 매퍼 호출
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
	}

}
