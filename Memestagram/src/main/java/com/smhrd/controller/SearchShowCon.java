package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.smhrd.model.PagingDTO;

public class SearchShowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("[SearchShowCon]");
		int page = Integer.parseInt(request.getParameter("page"));
		String keyword = request.getParameter("keyword");
		BoardDAO BoardDAO = new BoardDAO();
		int page_row_cnt = 2;
		int start = 1 + (page -1) * page_row_cnt ;
		int end = page * page_row_cnt;
		
		System.out.println("page : " + page);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("keyword : " + keyword);
		
		PagingDTO p = new PagingDTO(start, end, keyword);
		
		ArrayList<BoardDTO> boardList = BoardDAO.searchshow(p);
		HttpSession session = request.getSession();
		
		for (BoardDTO b : boardList) {
			String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
			int board_seq = b.getBoard_seq();
			int likecheck = new BoardDAO().likecheck(new BoardDTO(board_seq, mem_id));
			
			
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
		}
		
		
		//request.setAttribute("boardList", boardList);
		
		Gson gson = new Gson();
		
		String json = gson.toJson(boardList);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		return null;
	}

}
