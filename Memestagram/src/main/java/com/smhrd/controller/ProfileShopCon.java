package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.ProfileProductDTO;
import com.smhrd.model.ShopDTO;

public class ProfileShopCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		List<ShopDTO> productList = (List)request.getAttribute("productList");
		 System.out.println(productList.get(0)); 
		 System.out.println(productList.get(1)); 
		 System.out.println(productList.get(2)); 
		 System.out.println(productList.get(3)); 
		
		
		
		
		return null;
	}

}
