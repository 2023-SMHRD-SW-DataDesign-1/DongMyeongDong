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
	public static ArrayList<BoardDTO> boardshow(PagingDTO p){
		SqlSession session = sqlSessionFactory.openSession(true);
		ArrayList<BoardDTO> board_list =(ArrayList)session.selectList("boardshow",p);
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
	public int boardCount() {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = session.selectOne("boardCount");
		session.close();
		return cnt;
	}
	public int likesave(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("likesave", dto);
		session.close();
		
		return row;
	}
	public int likedelete(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("likedelete", dto);
		session.close();
		
		return row;
	}
	public int likecheck(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int likecheck = session.selectOne("likecheck", dto);
		session.close();
		
		return likecheck;

	}
	public int likecount(BoardDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int likecount = session.selectOne("likecount", dto);
		session.close();
		return likecount;
	}
}
