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

public class NaverLoginCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		String result = "";
		
		String email = request.getParameter("email");
        String name = request.getParameter("name");
        System.out.println("[NaverLoginCon]");
        System.out.println("naver email : "+email);
        System.out.println("naver name : "+name);
        
        HttpSession session = request.getSession();
        
        String login_type = "naver";
        
        MemberDTO m1 = new MemberDTO(name, email,login_type);
        MemberDTO m2 = mdao.snsLogin(m1);
        
        
        
        if(Objects.isNull(m2)== true) {
        	m1.setLogin_type("naver");
        	session.setAttribute("member", m1);
        	result ="N";
        }else {
        	session.setAttribute("member", m2);
        	result ="Y";
        }
        
        
        Gson gson = new Gson();
        String json = gson.toJson(result);
        response.setContentType("text/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        
        
        
		return null;
	}

}
