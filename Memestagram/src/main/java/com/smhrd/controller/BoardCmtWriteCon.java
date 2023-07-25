package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.BoardCmtDTO;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.MemberDTO;


public class BoardCmtWriteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		 // 댓글 내용을 받아옴
        String board_cmt_content = request.getParameter("content");
        // 게시글 고유 번호를 받아옴
        int board_seq = Integer.parseInt(request.getParameter("bseq"));
        // 사용자 ID를 받아옴
        String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();

        System.out.println("cmtcontent : "+ board_cmt_content);
        // 여기서 댓글 내용, 게시글 고유 번호, 사용자 ID를 활용하여 데이터베이스에 저장 또는 처리 작업을 수행

        int row = new BoardCmtDAO().cmtupload(new BoardCmtDTO(
        		board_seq, mem_id, board_cmt_content));
		
        
		int cmt_count = new BoardCmtDAO().cmtCount(board_seq);
		
		Gson gson = new Gson();
		String json = gson.toJson(cmt_count);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
        
		
		return null;
		
	}
}