package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BoardCmtDAO {
	
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int cmtupload(BoardCmtDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("upload", dto);
		session.close();
		
		return row;
	}
	public int cmtdelete(String board_cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("deletecmt", board_cmt_seq);
		session.close();
		
		return row;
	}

}
