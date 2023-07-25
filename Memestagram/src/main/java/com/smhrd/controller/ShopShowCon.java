package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopDTO;

public class ShopShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[showShowCon]");
		
		
		
		List<ShopDTO> productList = new ShopDAO().showProduct();
		
		request.setAttribute("productList", productList);
		
		
		
		
		return "forward/Shop.jsp";
	}

}
