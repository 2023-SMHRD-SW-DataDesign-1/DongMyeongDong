package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;

public class Profile_editCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 연결 잘됐는지 확인하기
		System.out.println("[Profile_editCon 연결 성공]");
		
		// 2. post방식 인코딩 하기
		request.setCharacterEncoding("UTF-8");
		
		// 3. 사용자가 수정한 데이터 받아오기
		String mem_id= request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String pw_ck = request.getParameter("pw_ck");
		
		// 4. 콘솔창에 출력하기
		System.out.println("mem_id : " + mem_id);
		System.out.println("pw : " + mem_pw);
		System.out.println("pw_ck : " + pw_ck);
		
		// 5. profileEdit메소드 불러오기
		ProfileDAO pdao = new ProfileDAO();
		ProfileDTO pdto = new ProfileDTO();
		
		int row = pdao.profileEdit(pdto);
		
		String moveURL = "";
		if(row > 0) {
			System.out.println("회원정보가 수정되었습니다.");
			request.setAttribute("mem_id", mem_id);
			moveURL = "./Profile.jsp";
			
		} else {
			System.out.println("회원정보 수정에 실패했습니다.");
			moveURL = "./Profile_edit.jsp";
		}
		
		 RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		 rd.forward(request, response);
		
		
		
		return null;
	}

}
