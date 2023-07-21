package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;



public class ProfileDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();

	public ProfileDTO showmember(ProfileDTO dto) {
		SqlSession session = sqlSessionFactory.openSession();
		ProfileDTO show = session.selectOne("showmember", dto);
		session.close();
		return show;
	}

}
