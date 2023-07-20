package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class KakaoLoginCon implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_name= request.getParameter("user_name");
        String email= request.getParameter("email");
        
        System.out.println(user_name);
        System.out.println(email);
        MemberDAO mdao = new MemberDAO();
        MemberDTO m = mdao.kakaoLogin(new MemberDTO(user_name, email));
        
        HttpSession session = request.getSession();
        String result = "";
        if (m != null) {
        	session.setAttribute("member", m);
        	result = "Y";
        }else {
        	m.setLogin_type("kakao");
        	session.setAttribute("member", m);
        	
        	result = "N";
        }
        
        Gson gson = new Gson();
        String json = gson.toJson(result);
        
        PrintWriter out = response.getWriter();
        out.print(json);
        
        
        
		return "Main.jsp";
	}

}
