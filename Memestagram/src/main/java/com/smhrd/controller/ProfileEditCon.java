package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;

public class ProfileEditCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 연결 잘됐는지 콘솔창에 출력하기
		System.out.println("[ProfileEditCon 연결 성공]");
		System.out.println("될 때까지 한다!!");

		// 2. 수정한 비밀번호 데이터 가져오기
		
		String mem_pw = request.getParameter("mem_pw");
		String mem_pw2 = request.getParameter("mem_pw2");
		String mem_id = request.getParameter("mem_id");

		// 3. 콘솔창에 확인하기
		
		
		System.out.println("비밀번호 확인" + mem_pw);
		System.out.println("비밀번호 확인" + mem_pw2);
		System.out.println("로그인한 아이디" + mem_id);
		
		

		// 6. profileEdit메소드 불러오기
		ProfileDTO pdto = new ProfileDTO(mem_id, mem_pw);
		ProfileDAO pdao = new ProfileDAO();
		int row = pdao.profileEdit(pdto);
		

		// 7. 실행결과에 따라서 성공 or 실패 콘솔창에 출력하기
		if(row > 0) {
			System.out.println("비밀번호 수정 성공");
			// 수정 성공 시 session의 member도 업데이트
			request.getSession().setAttribute("member", pdto);
		}else {
			System.out.println("비밀번호 수정 실패");
		}
		 

		return "./New_profile.jsp";

	}

}
