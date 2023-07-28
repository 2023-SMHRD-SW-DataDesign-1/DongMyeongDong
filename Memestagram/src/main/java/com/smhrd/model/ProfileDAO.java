package com.smhrd.model;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



import com.smhrd.database.sqlsessionmanager;



public class ProfileDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
	
	
	
	// 프로필화면에서 회원정보 보여주는 메소드
	public static ProfileDTO profileShow2(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ProfileDTO show = session.selectOne("profileShow", mem_id);
		session.close();
		return show;
	}
	
	
	// 프로필편집화면에서 이미지와 비밀번호 수정 메소드
	public int profileEdit(ProfileDTO pdto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("profileEdit", pdto);
		session.close();
		return row;
	}
	

	// 프로필편집화면에서 사진 변경하는 메소드
//	public int uploadImg(ProfileImgDTO pdto) {
//		SqlSession session = sqlSessionFactory.openSession(true);
//		int row = session.update("uploadImg", pdto);
//		session.close();
//		return row;
//	}
	
	
	// 프로필화면에서 게시물 보여주는 메소드
	public static ArrayList<BoardDTO> boardList(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<BoardDTO> board_list = (ArrayList)session.selectList("boardList", mem_id);
		session.close();
		return board_list;
	}
	

	// 프로필화면에서 구매한 상품목록 보여주는 메소드
	public static ArrayList<ProfileProductDTO> shoppingList(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<ProfileProductDTO> shopping_list = (ArrayList)session.selectList("shoppingList", mem_id);
		session.close();
		return shopping_list;
	}
	
	
	public ProfileDTO showReward(String mem_id) {
		SqlSession session = sqlSessionFactory.openSession();
		ProfileDTO profile = session.selectOne("showReward", mem_id);
		session.close();
		return profile;
	}
		

		


}
