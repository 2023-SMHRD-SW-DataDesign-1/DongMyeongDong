package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class FollowDAO {
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	// 프로필 화면에서 회원정보 보여주는 메소드
	public static ProfileDTO profileShow2(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ProfileDTO show = session.selectOne("profileShow", mem_id);
		session.close();
		return show;

	}

	public int follow(FollowDTO f) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.insert("Follow", f);
		session.close();
		return result;
	}

	public int unfollow(FollowDTO f) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.delete("unFollow", f);
		session.close();
		return result;
	}

	public FollowDTO followCheck(FollowDTO f) {
		SqlSession session = sqlSessionFactory.openSession(true);
		FollowDTO fdto = session.selectOne("followCheck", f);
		session.close();
		return fdto;
	}
}
