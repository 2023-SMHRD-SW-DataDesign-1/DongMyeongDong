package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BoardCmtDAO {
	
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int cmtupload(BoardCmtDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("cmtupload", dto);
		session.close();
		
		return row;
	}
	public int BoardcmtDelete(int board_cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("BoardcmtDelete", board_cmt_seq);
		session.close();
		
		return row;
	}
	
	public List<BoardCmtDTO> cmtList(BoardCmtDTO bcmt) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardCmtDTO> cmtList = session.selectList("cmtList", bcmt);
		session.close();
		
		return cmtList;
	}
	public int cmtCount(int board_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cmt_count = session.selectOne("cmtCount", board_seq);
		session.close();
		
		return cmt_count;		
	}
	public List<BoardCmtDTO> cmtAllList(int board_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardCmtDTO> list = session.selectList("cmtAllList", board_seq);
		session.close();
		return list;
	}

}
