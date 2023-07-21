package com.smhrd.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class SnsJoinCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDAO mdao = new MemberDAO();
		
		String savePath = request.getServletContext().getRealPath("/profile_img");

		File Folder = new File(savePath);

		if (!Folder.exists()) {
			try {
				Folder.mkdir();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println(savePath);

		// 3. maxSize
		int maxSize = 10 * 1024 * 1024;

		// 4. encoding
		String encoding = "UTF-8";

		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);

		String id = multi.getParameter("id");
		String pro_img = multi.getFilesystemName("pro_img");

		if (pro_img == null) {
			pro_img = " ";
		}

		

		MemberDTO m = (MemberDTO) session.getAttribute("member");

		System.out.println(id);
		
		MemberDTO mResult = new MemberDTO();
		
		if (m.getLogin_type().equals("kakao")) {
			MemberDTO m2 = new MemberDTO(id,pro_img, m.getMem_email(), "kakao");
			System.out.println(m2.getLogin_type());
			mdao.snsJoin(m2);
			mResult = mdao.snsLogin(m2);
		} else if (m.getLogin_type().equals("naver")) {
			MemberDTO m2 = new MemberDTO(id,pro_img, m.getMem_email(), "naver");
			System.out.println(m2.getLogin_type());
			mdao.snsJoin(m2);
			mResult = mdao.snsLogin(m2);
		}
		
		session.setAttribute("member", mResult);
		
		return "Home.jsp";
	}

}
