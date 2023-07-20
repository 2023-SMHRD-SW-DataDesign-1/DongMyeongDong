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
import com.smhrd.model.BoardDTO;

@WebServlet("/BoardCmtWriteCon.do")
public class BoardCmtWriteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 // 댓글 내용을 받아옴
        String board_cmt_content = request.getParameter("board_cmt_content");
        // 게시글 고유 번호를 받아옴
        int board_seq = Integer.parseInt(request.getParameter("board_seq"));
        // 사용자 ID를 받아옴
        String mem_id = request.getParameter("mem_id");

        // 여기서 댓글 내용, 게시글 고유 번호, 사용자 ID를 활용하여 데이터베이스에 저장 또는 처리 작업을 수행

        int row = new BoardCmtDAO().upload(new BoardCmtDTO(
        		board_seq, mem_id, board_cmt_content));
		
		// 성공 실패 여부확인
		if(row>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
		return "./Home.jsp";
		
	}
}