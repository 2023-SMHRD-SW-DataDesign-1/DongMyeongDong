package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.command;
import com.smhrd.model.FollowDAO;
import com.smhrd.model.FollowDTO;
import com.smhrd.model.MemberDTO;

public class UnFollowCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String follower = request.getParameter("follow_id");
		
		HttpSession session = request.getSession();
		String following =  ((MemberDTO)session.getAttribute("member")).getMem_id();
		
		int result = new FollowDAO().unfollow(new FollowDTO(following, follower));
		
		if (result>0) {System.out.println("언팔로우 성공");}
		
		return null;
		
	}

}
