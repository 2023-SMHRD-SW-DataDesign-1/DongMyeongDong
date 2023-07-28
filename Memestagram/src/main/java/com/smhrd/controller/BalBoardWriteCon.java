package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.BalanceDAO;
import com.smhrd.model.BalanceDTO;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;
import com.smhrd.model.MemberDTO;

public class BalBoardWriteCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[balboardwritecon]");

		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		//3.maxsize
		int maxsize = 1000*1024*1024;
		
		//4.encoding
		String encoding = "UTF-8";
		
		//5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		
		MultipartRequest multi =null;
		try {
			multi = new MultipartRequest(
					request, savePath,maxsize,encoding,rename);
		} catch (IOException e) {

			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String mem_id = ((MemberDTO) session.getAttribute("member")).getMem_id();
		String bal_content = multi.getParameter("bal_content");
		String bal_img = multi.getFilesystemName("bal_img");
		String bal_left = multi.getParameter("bal_left");
		String bal_left_color = multi.getParameter("select_1_color");
		String bal_right = multi.getParameter("bal_right");
		String bal_right_color = multi.getParameter("select_2_color");
		int bal_reward = Integer.parseInt(multi.getParameter("bal_reward"));
		String bal_time = multi.getParameter("bal_time");
		System.out.println(bal_img);
		int row = new BalanceDAO().balboardupload(new BalanceDTO(
				mem_id, bal_content, bal_img, bal_left, bal_right, bal_reward, bal_time, bal_left_color, bal_right_color));
		
		// 성공 실패 여부확인
		if(row>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
		return "New_home.jsp";
}
}
