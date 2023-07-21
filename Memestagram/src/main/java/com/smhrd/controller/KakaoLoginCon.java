package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

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
        String login_type = "kakao";
        MemberDTO m1 = new MemberDTO(user_name, email,login_type);
        MemberDTO m2 = mdao.snsLogin(m1);
        
        HttpSession session = request.getSession();
        
        String result = "";
        
        if (Objects.isNull(m2) == true) {
        	m1.setLogin_type("kakao");
        	session.setAttribute("member", m1);
        	result = "N";
        }else {
        	session.setAttribute("member", m2);
        	result = "Y";
        }
        
      
        
        Gson gson = new Gson();
		// [{  },{  }]
		String json = gson.toJson(result);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out =response.getWriter();
		out.println(json); 
		System.out.println(json);
        
		return null;
	}

}
