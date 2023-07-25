package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.PagingDTO;

public class BoardShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[showboard]");
		
		System.out.println(request.getServletContext().getRealPath("/profile_img"));
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
		HttpSession session = request.getSession();
		
		for (BoardDTO b : boardList) {
			String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
			int board_seq = b.getBoard_seq();
			int likecheck = new BoardDAO().likecheck(new BoardDTO(board_seq, mem_id));
			if(likecheck>0) {
				b.setChecklike("Y");
			}else {
				b.setChecklike("N");
			}
		}
		
		
		//request.setAttribute("boardList", boardList);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(boardList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		
		
		return null;
	}
}