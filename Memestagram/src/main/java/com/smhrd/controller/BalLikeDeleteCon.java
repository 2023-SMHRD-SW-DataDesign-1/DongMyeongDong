package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BalanceDAO;
import com.smhrd.model.BalanceDTO;
import com.smhrd.model.MemberDTO;

public class BalLikeDeleteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("[ballikedeletecon]");
		HttpSession session = request.getSession();
		String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
		int bal_seq = Integer.parseInt(request.getParameter("bal_seq"));
		
		
		System.out.println("bal_seq :" +bal_seq);
		System.out.println("mem_id :" +mem_id);
		
		BalanceDAO a= new BalanceDAO();
        int row = a.ballikedelete(new BalanceDTO(
        		bal_seq, mem_id));
		
		// 성공 실패 여부확인
		if(row>0) {
			
			System.out.println("좋아요 제거 성공");
		}else {
			System.out.println("좋아요 제거 실패");
		}
		
		BalanceDTO bto = new BalanceDTO();
		bto.setBal_seq(bal_seq);
		int heart = a.ballikecount(bto);
		
		Gson gson = new Gson();
		String json = gson.toJson(heart);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		System.out.println(json);
		
		return null;
}
}