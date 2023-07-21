package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BoardDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int boardupload(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("boardupload", dto);
		session.close();
		
		return row;
	}
	public static ArrayList<BoardDTO> boardshow(){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<BoardDTO> board_list =(ArrayList)session.selectList("boardshow");
	session.close();
	
	return board_list;
	}
	
	public static ArrayList<BoardDTO> myboard(){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<BoardDTO> board_list =(ArrayList)session.selectList("myboard");
	session.close();
	
	return board_list;
	}
	
	public int boarddelete(String board_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("boarddelete", board_seq);
		session.close();
		
		return row;
	}
	public int boardupdate(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.update("boardupdate", dto);
		session.close();
		
		return row;
	}



}
