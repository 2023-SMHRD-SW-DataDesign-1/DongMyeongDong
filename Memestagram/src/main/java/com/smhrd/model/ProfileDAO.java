package com.smhrd.model;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



import com.smhrd.database.sqlsessionmanager;



public class ProfileDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
	
	
	
	// 프로필 화면에서 회원정보 보여주는 메소드
	public static ProfileDTO profileShow2(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ProfileDTO show = session.selectOne("profileShow", mem_id);
		session.close();
		return show;
		
	}
	
	
	// 프로필 편집 화면에서 비밀번호 수정 메소드
	public int profileEdit(ProfileDTO pdto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("profileEdit", pdto);
		session.close();
		return row;
		
	}
		

		


}
