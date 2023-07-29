package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BalCmtDAO;
import com.smhrd.model.BalCmtDTO;
import com.smhrd.model.BoardCmtDAO;
import com.smhrd.model.MemberDTO;

public class CmtDeleteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
      
      // 댓글 고유 번호를 받아옴
      int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
      // 밸런스 댓글인지 일반 글 댓글인지 판별하는 문자열 받아옴
      String type = request.getParameter("type");
      // 사용자 ID를 받아옴
    

     
      // 여기서 댓글 내용, 게시글 고유 번호, 사용자 ID를 활용하여 데이터베이스에 저장 또는 처리 작업을 수행
      
      
      if(type.equals("bal")) {
    	  int row = new BalCmtDAO().balDeleteCmt(cmt_seq);
      }else {
    	  int row = new BoardCmtDAO().BoardcmtDelete(cmt_seq);
      }
      
		
      
	
		return null;
	}

}
