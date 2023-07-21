package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class MemberDAO {
	
		static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
		
		
		public String idCheck(String id) {
			SqlSession session = sqlSessionFactory.openSession(true);
			String checkId = session.selectOne("idCheck", id);
			session.close();
			return checkId;
		
	}


		public int JoinMember(MemberDTO m) {
			SqlSession session = sqlSessionFactory.openSession(true);
			int result = session.insert("joinMember", m);	
			session.close();
			return result;
		}


//		public MemberDTO kakaoLogin(MemberDTO m) {
//			SqlSession session = sqlSessionFactory.openSession(true);
//			System.out.println("---------------");
//			System.out.println(m.getMem_id());
//			System.out.println(m.getMem_email());
//			MemberDTO mem = session.selectOne("kakaoLogin", m);
//			return mem;
//		}


//		public int kakaoJoin(MemberDTO m) {
//			SqlSession session = sqlSessionFactory.openSession(true);
//			int result = session.insert("kakaoJoin", m);	
//			session.close();
//			return result;
//		}


		public MemberDTO snsLogin(MemberDTO m) {
			SqlSession session = sqlSessionFactory.openSession(true);
			MemberDTO mem = session.selectOne("snsLogin", m);
			session.close();
			return mem;
		}


		public int snsJoin(MemberDTO m) {
			SqlSession session = sqlSessionFactory.openSession(true);
			int result = session.insert("snsJoin", m);	
			session.close();
			return result;
		}
}
