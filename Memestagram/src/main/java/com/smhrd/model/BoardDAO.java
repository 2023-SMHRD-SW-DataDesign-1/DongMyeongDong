package com.smhrd.model;

import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class BoardDAO {

	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
}
