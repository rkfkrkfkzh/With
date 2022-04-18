package com.example.with.notice;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

import static java.util.prefs.Preferences.factory;

@Mapper
public interface NoticeMapper { // @Mapper 어노테이션을 붙이면 Mapper 인터페이스로 인식합니다.

	void insertNotice(Notice n);

	List selectAllNotice();

	Notice selectNotice(int notice_num);

	void updateNotice(Notice n);

	void deleteNotice(int notice_num);

	public static int totalRecord(){
		SqlSession session = factory.openSession();
		int total = session.selectOne("notice.totalRecord");
		session.close();
		return total;
	}
	public static List<Notice> listNotice(int start, int end){
		HashMap<String, Integer>map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);

		SqlSession session = factory.openSession();
		List<Notice> list = session.selectList("notice.findall", map);
		session.close();
		return list;
	}
}
