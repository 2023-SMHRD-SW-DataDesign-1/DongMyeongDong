package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BalanceDAO {
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public int ballikesave(BalanceDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("ballikesave", dto);
		session.close();
		
		return row;
	}
	public int ballikedelete(BalanceDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.delete("ballikedelete", dto);
		session.close();
		
		return row;
	}
	public int ballikecheck(BalanceDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int ballikecheck = session.selectOne("ballikecheck", dto);
		session.close();
		
		return ballikecheck;

	}
	public int ballikecount(BalanceDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int ballikecount = session.selectOne("ballikecount", dto);
		session.close();
		return ballikecount;
	}
	
}
