package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.command;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.ProfileDTO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopDTO;

public class BuyProductCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("product_name"); 
		int price = Integer.parseInt(request.getParameter("product_price"));
		HttpSession session = request.getSession();
		MemberDTO m =  (MemberDTO) session.getAttribute("member");
		
		
		ShopDAO sdao = new ShopDAO();
		int result = sdao.buyProduct(new ShopDTO(name, m.getMem_id()));
		
		if(result > 0) {
			System.out.println("shopping_list insert 성공");
		}else {
			System.out.println("shopping_list insert 실패");
			
		}
		// 본인 리워드에서 상품 가격 뺀값
		price = m.getMem_reward() - price;
		System.out.println("본인 리워드에서 상품 가격 뺀값 : "+price);
		sdao.updateReward(new ShopDTO(price, m.getMem_id()));
		
		m.setMem_reward(price);
		
		session.setAttribute("member", m);
		
		
		return "ShopShowCon.do";
	}

}
