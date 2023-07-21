package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.command.command;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardDTO;

public class BoardUpdateCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
System.out.println("[boardupdatecon]");

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
		
		String board_img =multi.getFilesystemName("board_img");
		String board_content = multi.getParameter("board_content");
		
		BoardDTO b_info = new BoardDTO(board_img, board_content);
		BoardDAO dao = new BoardDAO();
		int result = dao.boardupdate(b_info);
		
		if(result>0) {
			System.out.println("업데이트 성공");
			// 수정 성공시 session의 info도 없데이트 
			request.getSession().setAttribute("b_info", b_info);
		}else {
			System.out.println("업데이트 실패");

		}
		return "./Main.jsp";
	}
}
