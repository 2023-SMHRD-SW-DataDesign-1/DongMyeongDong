package com.smhrd.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;

public class BoardDeleteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[DeleteBoardCon]");
		
		String board_seq = request.getParameter("board_seq");
		System.out.println("번호 : " + board_seq);
		
		BoardDAO dao = new BoardDAO();
		int row = dao.boarddelete(board_seq);
		
		if (row > 0) {
	         System.out.println("게시글 삭제 성공");
	      } else {
	         System.out.println("게시글 삭제 실패");
	      }
		
	return "./profile.jsp";
      
	}
}
