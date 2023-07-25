package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.BoardCmtDTO;

public class BoardCmtListCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int board_seq = Integer.parseInt(request.getParameter("bseq"));

		List<BoardCmtDTO> cmtList = new BoardCmtDAO().cmtList(board_seq);

		Gson gson = new Gson();
		String json = gson.toJson(cmtList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}
