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

public class BalDetailShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bal_seq = Integer.parseInt(request.getParameter("bal_seq"));
		
		
		BalanceDTO baldto = new BalanceDAO().detailShowBal(bal_seq);
		
		HttpSession session = request.getSession();

		
		String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
		
		int ballikecheck = new BalanceDAO().ballikecheck(new BalanceDTO(baldto.getBal_seq(), mem_id));
		System.out.println("밸런스 게시글 내용 : " +baldto.getBal_content());
		System.out.println("왼쪽 선택자 수 : "+ baldto.getBal_left_count() );
		System.out.println("오른쪽 선택자 수 : "+ baldto.getBal_right_count() );
		if (ballikecheck > 0) {
			baldto.setBalCheckLike("Y");
		} else {
			baldto.setBalCheckLike("N");
		}
		
		
		Gson gson = new Gson();
		String json = gson.toJson(baldto);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		return null;
	}

}
