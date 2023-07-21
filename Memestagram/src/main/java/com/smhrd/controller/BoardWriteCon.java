package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;

public class BoardWriteCon implements command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("[boardwritecon]");
		
		// MultipartRequest변수 설정
		// 1. request객체
		// 2. savePath(저장경로)
		String savePath = request.getServletContext().getRealPath("img");
		System.out.println(savePath);
		
		//3.maxsize
		int maxsize = 100*1024*1024;
		
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
		
		String mem_id = multi.getParameter("member.mem_id");
		String board_content = multi.getParameter("board_content");
		String board_img = multi.getFilesystemName("board_img");
		
		if(board_content ==null) {
			board_content = "";
		}
		if(board_img ==null) {
			board_img = "";
		}
			
		
		System.out.println("id : "+mem_id);
		System.out.println("content : "+board_content);
		System.out.println("filename : "+board_img);
		
		
		
		//upload메소드 호출
		int row = new BoardDAO().boardupload(new BoardDTO(
				mem_id,  board_content, board_img));
		
		// 성공 실패 여부확인
		if(row>0) {
			System.out.println("업로드 성공");
		}else {
			System.out.println("업로드 실패");
		}
		
		return "Home.jsp";
	}

}