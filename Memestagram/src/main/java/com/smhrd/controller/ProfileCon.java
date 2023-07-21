package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.command.command;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;


public class ProfileCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// ProfileDAO에서 showmember메소드 불러오기
		ProfileDAO pdao = new ProfileDAO();
		ProfileDTO pdto = new ProfileDTO();
		ProfileDTO show = pdao.showmember(pdto);

		// 데이터 확인하기
		String mem_id = show.getMem_id();
		String mem_img = show.getMem_img();
		int mem_reward = show.getMem_reward();
		int following = show.getFollowing();
		int follower = show.getFollower();
		int boardcount = show.getBoardcount();
		String board = show.getBoard();
	
		
		// 콘솔창에서 확인하기 
		System.out.println("아이디, 이미지경로, 리워드, 게시물 수 : " + mem_id + mem_img + mem_reward + boardcount + board);
		System.out.println("팔로잉 수, 팔로워 수 : " + following + follower);

		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_img", mem_img);
		request.setAttribute("mem_reward", mem_reward);
		request.setAttribute("following", following);
		request.setAttribute("follower", follower);
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("board", board);

		
		return null;
		
		
	}

	
}