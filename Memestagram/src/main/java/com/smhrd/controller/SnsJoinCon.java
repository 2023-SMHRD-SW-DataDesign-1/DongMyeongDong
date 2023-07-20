package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class SnsJoinCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		
		MemberDTO m  = (MemberDTO) session.getAttribute("member");
		m.setMem_id(id);
		MemberDAO mdao = new MemberDAO();
		if(m.getLogin_type().equals("kakao")) {
			mdao.kakaoJoin(m);
		}else if (m.getLogin_type().equals("naver")){
			mdao.naverJoin(m);
		}
				
		return "Login.jsp";
	}

}
