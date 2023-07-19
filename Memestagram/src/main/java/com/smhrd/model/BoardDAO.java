package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BoardDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int upload(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("upload", dto);
		session.close();
		
		return row;
	}
	public static ArrayList<BoardDTO> showboard(){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<BoardDTO> board_list =(ArrayList)session.selectList("showboard");
	session.close();
	
	return board_list;
	}




}
