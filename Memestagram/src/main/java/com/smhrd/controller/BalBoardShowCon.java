package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BalanceDAO;
import com.smhrd.model.BalanceDTO;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.PagingDTO;

public class BalBoardShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[balboardshowcon]");
		int page = Integer.parseInt(request.getParameter("page"));
		BalanceDAO BalDAO = new BalanceDAO();
		int page_row_cnt = 1;
		int start = 1 + (page - 1) * page_row_cnt;
		int end = page * page_row_cnt;

		System.out.println("page : " + page);
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		PagingDTO p = new PagingDTO(start, end);

		List<BalanceDTO> balanceList = BalDAO.balanceShow(p);
		HttpSession session = request.getSession();

		for (BalanceDTO b : balanceList) {
			String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
			int bal_seq = b.getBal_seq();
			int ballikecheck = new BalanceDAO().ballikecheck(new BalanceDTO());
			System.out.println(b.getBal_content());
			if (ballikecheck > 0) {
				b.setBalCheckLike("Y");
			} else {
				b.setBalCheckLike("N");
			}
		}

		// request.setAttribute("boardList", boardList);

		Gson gson = new Gson();

		String json = gson.toJson(balanceList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);

		return null;

	}
}