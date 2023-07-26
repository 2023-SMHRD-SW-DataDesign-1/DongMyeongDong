package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.BoardCmtDTO;
import com.smhrd.model.MemberDTO;

public class BoardCmtListCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int board_seq = Integer.parseInt(request.getParameter("bseq"));
		HttpSession session = request.getSession();
		MemberDTO m = (MemberDTO) session.getAttribute("member");
		List<BoardCmtDTO> cmtList = new BoardCmtDAO().cmtList(new BoardCmtDTO(board_seq, m.getMem_id()));

		Gson gson = new Gson();
		String json = gson.toJson(cmtList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}
