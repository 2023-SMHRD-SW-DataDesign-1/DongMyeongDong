package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.BoardCmtDTO;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;

public class LikeUploadCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[likeuploadcon]");

		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		String mem_id = request.getParameter("mem_id");
		
		System.out.println("board_seq :" +board_seq);
		System.out.println("mem_id :" +mem_id);
		
        int row = new BoardDAO().likeupload(new BoardDTO(
        		board_seq, mem_id));
		
		// 성공 실패 여부확인
		if(row>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
		return null;
}
}