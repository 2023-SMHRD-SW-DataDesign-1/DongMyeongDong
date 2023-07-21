package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.ibatis.reflection.SystemMetaObject;

import com.smhrd.command.command;
import com.smhrd.model.FollowDTO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.ProfileDAO;


public class ProfileCon implements command {

	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProfileDAO dao = new ProfileDAO();
		MemberDTO dto = new MemberDTO();
		MemberDTO show = dao.showmember();

		// 데이터 확인하기
		String mem_id = show.getMem_id();
		String mem_img = show.getMem_img();
		
		FollowDTO following = show.getFollowList().get(0);
		FollowDTO follower = show.getFollowList().get(1);

		
		System.out.println("팔로잉, 팔로워 : " + following + follower);

		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_img", mem_img);
	
		request.setAttribute("following", following);
		request.setAttribute("follower", follower);
		return null;
	}

}
