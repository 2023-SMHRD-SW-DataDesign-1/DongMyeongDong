package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.smhrd.database.sqlsessionmanager;

public class ProfileDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
	
	public MemberDTO showmember() {
		 SqlSession session = sqlSessionFactory.openSession();
		
		MemberDTO show = session.selectOne("showmember");
		session.close();
		return show;
	}
	
}
