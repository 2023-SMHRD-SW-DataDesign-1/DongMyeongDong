package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BalCmtDAO {
	
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int balCmtUpload(BalCmtDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("balCmtUpload", dto);
		session.close();
		
		return row;
	}
	public int balDeleteCmt(int bal_cmt_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("balDeleteCmt", bal_cmt_seq);
		session.close();
		
		return row;
	}
	
	public List<BalCmtDTO> balCmtList(BalCmtDTO bcmt) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BalCmtDTO> cmtList = session.selectList("balCmtList", bcmt);
		session.close();
		
		return cmtList;
	}
	public int balCmtCount(int board_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cmt_count = session.selectOne("balCmtCount", board_seq);
		session.close();
		
		return cmt_count;		
	}
	public List<BalCmtDTO> balCmtAllList(int bal_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BalCmtDTO> list = session.selectList("balCmtAllList", bal_seq);
		session.close();
		return list;
	}
	public int balCmtDelete(BalCmtDTO balCmtDTO) {
		
		return 0;
	}
}
