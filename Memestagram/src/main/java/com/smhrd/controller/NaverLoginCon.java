package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		String email= request.getParameter("email");
        String name= request.getParameter("name");
        System.out.println("[NaverLoginCon]");
        System.out.println("naver email : "+email);
        System.out.println("naver name : "+name);
        
        HttpSession session = request.getSession();
        MemberDAO mdao = new MemberDAO();
        
        MemberDTO m = mdao.naverLogin(new MemberDTO(name, email));
        String result = "";
        if(m != null) {
        	session.setAttribute("member", m);
        	result ="Y";
        }else {
        	m.setLogin_type("naver");
        	session.setAttribute("member", m);
        	result ="N";
        }
        
        Gson gson = new Gson();
        String json = gson.toJson(result);
        
        PrintWriter out = response.getWriter();
        out.print(json);
        
        
        
		return "Main.jsp";
	}

}
