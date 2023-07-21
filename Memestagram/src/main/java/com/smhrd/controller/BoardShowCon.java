package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;

public class BoardShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[showboard]");
		BoardDAO BoardDAO = new BoardDAO();
		
		ArrayList<BoardDTO> boardList = BoardDAO.boardshow();
		request.setAttribute("boardList", boardList);
        
		
return "forward/Home.jsp";
}
}