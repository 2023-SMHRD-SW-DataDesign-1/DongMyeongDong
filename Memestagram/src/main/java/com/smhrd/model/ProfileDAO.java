package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;



public class ProfileDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	
	// 프로필 화면에서 회원정보 보여주는 메소드
	public ProfileDTO showmember(ProfileDTO pdto) {
		SqlSession session = sqlSessionFactory.openSession();
		ProfileDTO show = session.selectOne("showmember", pdto);
		session.close();
		return show;
	}
	
	// 프로필 화면에서 게시물 보여주는 메소드
	public void boardContent() {
		
	}
	
	
	// 프로필 편집 화면에서 수정 메소드
	public int profileEdit(ProfileDTO pdto) {
		SqlSession session = sqlSessionFactory.openSession();
		int row = session.update("profileEdit", pdto);
		session.close();
		return row;
		
	}
		

		


}
