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
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		BoardDAO BoardDAO = new BoardDAO();
		
		PagingDTO p = new PagingDTO(num+1, num+3);
		ArrayList<BoardDTO> boardList = BoardDAO.boardshow(p);
		
		for (BoardDTO b : boardList) {
			System.out.println(b.getBoard_content());
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