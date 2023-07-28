package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.FollowDAO;
import com.smhrd.model.FollowDTO;
import com.smhrd.model.MemberDTO;

public class BoardDetailShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		System.out.println(board_seq);
		BoardDTO b = new BoardDAO().detailShow(board_seq);
		System.out.println(b.getBoard_content());
		HttpSession session = request.getSession();
		
		
		String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
		 
		int likecheck = new BoardDAO().likecheck(new BoardDTO(b.getBoard_seq(), mem_id));
			
			
		if (mem_id.equals(b.getMem_id()) ) {
				b.setCheckFollow("E");
		}else {
			FollowDTO fdto = new FollowDAO().followCheck(new FollowDTO(mem_id,b.getMem_id()));
			if(Objects.isNull(fdto) == false) {
				b.setCheckFollow("Y");
				
				System.out.println("if문 들어옴");
				System.out.println(b.getMem_id());
			}else if (Objects.isNull(fdto) == true){
				b.setCheckFollow("N");
				System.out.println(b.getMem_id());
				System.out.println("else문 들어옴");
			} 
			
		}	
		
		if(likecheck>0) {
			b.setChecklike("Y");
		}else {
			b.setChecklike("N");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(b);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		
		return null;
	}

}
