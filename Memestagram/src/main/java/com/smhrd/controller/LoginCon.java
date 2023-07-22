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
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class LoginCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("LoginCon----------");
		System.out.println(id);
		System.out.println(pw);
		HttpSession session = request.getSession();
		
		MemberDTO m = new MemberDAO().memLogin(new MemberDTO(id, pw));
		String loginCheck = "";
		if (Objects.isNull(m) == true) {
        	
        	
			loginCheck = "N";
        	
        }else {
        	session.setAttribute("member", m);
        	loginCheck = "Y";
        }
		
		Gson gson = new Gson();
		String json = gson.toJson(loginCheck);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		System.out.println(json);
        		
		return null;
	}

}
