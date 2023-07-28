package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.MemberDTO;
import com.smhrd.model.ProfileDAO;
import com.smhrd.model.ProfileDTO;

public class ProfileEditCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 연결 잘됐는지 콘솔창에 출력하기
		System.out.println("===========================");
		System.out.println("[ProfileEditCon 연결 성공]");

		String savePath = request.getServletContext().getRealPath("image");
		System.out.println(savePath);

		// 3. maxSize
		int maxSize = 100 * 1024 * 1024;

		// 4. encoding
		String encoding = "UTF-8";

		// 5. 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		// new MultipartRequest(request, savePath, maxSize, encoding, 중복제거)
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);

		// 6. 데이터 받아오기
		String mem_id = multi.getParameter("mem_id");
		String mem_pw = multi.getParameter("mem_pw");
		String mem_pw2 = multi.getParameter("mem_pw2");
		String mem_img = multi.getFilesystemName("mem_img");

		// 2. 수정한 비밀번호 데이터 가져오기
//		String mem_id = request.getParameter("mem_id");
//		String mem_pw = request.getParameter("mem_pw");
//		String mem_pw2 = request.getParameter("mem_pw2");
//		String mem_img = request.getParameter("mem_img");
//		

		// 3. 콘솔창에 확인하기
		System.out.println("로그인한 아이디 : " + mem_id);
		System.out.println("비밀번호 확인 : " + mem_pw);
		System.out.println("변경비밀번호 확인 : " + mem_pw2);
		System.out.println("변경이미지 확인 : " + mem_img);

		System.out.println("===========================");

		// 6. profileEdit메소드 불러오기
		ProfileDTO pdto = new ProfileDTO(mem_id, mem_pw, mem_pw2, mem_img);
		ProfileDAO pdao = new ProfileDAO();
		int row = pdao.profileEdit(pdto);

		// 7. 실행결과에 따라서 성공 or 실패 콘솔창에 출력하기
		if (row > 0) {
			System.out.println("비밀번호수정성공 row = " + row);

			// 수정 성공 시 session의 기존 member도 업데이트
			// 기존의 member객체에는 eamil, reward도 포함되어 있으므로 pw와 img만 업데이트한다
			HttpSession session = request.getSession();
			MemberDTO mdto = (MemberDTO) session.getAttribute("member");
			mdto.setMem_pw(mem_pw);
			mdto.setMem_img(mem_img);
			session.setAttribute("member", mdto);

		} else {
			System.out.println("비밀번호수정실패 row = " + row);

		}

		return "New_profile.jsp";
	}

}
