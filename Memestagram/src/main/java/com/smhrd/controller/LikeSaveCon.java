package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.MemberDTO;

public class LikeSaveCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[likesavecon]");
		HttpSession session = request.getSession();
		String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		
		
		System.out.println("board_seq :" +board_seq);
		System.out.println("mem_id :" +mem_id);
		
		BoardDAO a= new BoardDAO();
        int row = a.likesave(new BoardDTO(
        		board_seq, mem_id));
		
		// 성공 실패 여부확인
		if(row>0) {
			
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		BoardDTO bto = new BoardDTO();
		bto.setBoard_seq(board_seq);
		int heart = a.likecount(bto);
		
		Gson gson = new Gson();
		String json = gson.toJson(heart);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		System.out.println(json);
		
		return null;
}
}