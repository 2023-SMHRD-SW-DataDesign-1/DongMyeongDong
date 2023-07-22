package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.PagingDTO;

public class BoardShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[showboard]");
		int page = Integer.parseInt(request.getParameter("page"));
		BoardDAO BoardDAO = new BoardDAO();
		int page_row_cnt = 2;
		int start = 1 + (page -1) * page_row_cnt ;
		int end = page * page_row_cnt;
		
		System.out.println("page : " + page);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		PagingDTO p = new PagingDTO(start, end);
		
		ArrayList<BoardDTO> boardList = BoardDAO.boardshow(p);
		
		for (BoardDTO b : boardList) {
			System.out.println(b.getBoard_content());
			System.out.println(b.getMem_img());
			System.out.println(b.getBoard_cmt_cnt());
		}
		
		request.setAttribute("boardList", boardList);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(boardList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
        
		
		return null;
	}
}