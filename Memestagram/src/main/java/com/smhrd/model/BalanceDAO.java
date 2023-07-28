package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

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
	
	public int balboardupload(BalanceDTO dto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int row = session.insert("balboardupload", dto);
		session.close();
		
		return row;
	}
	public List<BalanceDTO> balanceShow(PagingDTO p) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BalanceDTO> bList= session.selectList("balanceShow", p);
		session.close();		
		return bList;
	}
	
	public BalanceDTO detailShowBal(int bal_seq) {
		SqlSession session = sqlSessionFactory.openSession(true);
		BalanceDTO bdto= session.selectOne("detailShowBal", bal_seq);
		session.close();		
		return bdto;
	}
	
	
	
	
}
