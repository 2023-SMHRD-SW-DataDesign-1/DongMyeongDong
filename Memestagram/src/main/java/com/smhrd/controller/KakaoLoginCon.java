package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;

public class KakaoLoginCon implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_name= request.getParameter("user_name");
        String login_id= request.getParameter("login_id");
        String u_nick= request.getParameter("u_nick");
        String email = request.getParameter("email");
        if(email!=null) {
           login_id=email;
        }if(u_nick==null) {
       	 u_nick=login_id;
        }
        System.out.println(user_name);
        System.out.println(login_id);
        System.out.println(u_nick);
		return null;
	}

}
