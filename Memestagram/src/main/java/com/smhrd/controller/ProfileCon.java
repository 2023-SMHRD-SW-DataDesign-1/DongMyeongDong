package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.ibatis.reflection.SystemMetaObject;

import com.smhrd.model.FollowDTO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;

@WebServlet("/ProfileCon")
public class ProfileCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ProfileDAO에서 showmember메소드 불러오기
		ProfileDAO dao = new ProfileDAO();
		ProfileDTO dto = new ProfileDTO(mem_id, mem_reward, mem_img, following, follower);
		ProfileDTO show = dao.showmember(dto);

		// 데이터 확인하기
		String mem_id = show.getMem_id();
		String mem_img = show.getMem_img();
		int mem_reward = show.getMem_reward();
		String following = show.getFollowing();
		String follower = show.getFollower();
	
		
		// 콘솔창에서 확인하기 
		System.out.println("아이디, 이미지경로, 리워드 : " + mem_id + mem_img + mem_reward);
		System.out.println("팔로잉, 팔로워 : " + following + follower);

		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_img", mem_img);
		request.setAttribute("mem_reward", mem_reward);
		request.setAttribute("following", following);
		request.setAttribute("follower", follower);

	}

}
