package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.BoardCmtDTO;
import com.smhrd.model.BoardDAO;



public class BoardCmtDeleteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[BoardCmtDeleteCon]");
		
		String board_cmt_seq = request.getParameter("board_cmt_seq");
		System.out.println("번호 : " + board_cmt_seq);
		
		BoardCmtDAO dao = new BoardCmtDAO();
		int row = dao.cmtdelete(board_cmt_seq);

	
		// 성공 실패 여부확인
		if(row>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
		return "./Home.jsp";
		
	}
}