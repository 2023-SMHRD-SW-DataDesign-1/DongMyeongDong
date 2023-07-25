package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.sqlsessionmanager;

public class ShopDAO {
	static SqlSessionFactory sqlSessionFactory = sqlsessionmanager.getSqlSession();
	
	
	public List<ShopDTO> showProduct() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<ShopDTO> productList = session.selectList("shopProduct");
		session.close();
		return productList;
	}

	public int buyProduct(ShopDTO sdto) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.insert("buyProduct",sdto);
		session.close();
		return result;
		
	}

	public int updateReward(ShopDTO shopDTO) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int result = session.update("updateReward", shopDTO);
		session.close();
		return result;
		
	}
}
