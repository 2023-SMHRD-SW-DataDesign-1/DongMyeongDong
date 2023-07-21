package com.smhrd.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class JoinCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[joinCon]");

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
		String pw = multi.getParameter("pw");
		String email = multi.getParameter("email");
		String pro_img = multi.getFilesystemName("pro_img");
		
		if (pro_img == null) {
			pro_img = " ";
		}
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		System.out.println("email : " + email);
		System.out.println("pro_img : " + pro_img);
		
		int result = new MemberDAO().JoinMember(new MemberDTO(id, pw, email, pro_img));
		
		if(result > 0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}

		return "Login.jsp";
	}

}
