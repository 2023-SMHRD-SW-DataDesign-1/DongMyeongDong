package com.smhrd.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.command.command;
import com.smhrd.controller.BalLikeDeleteCon;
import com.smhrd.controller.BalLikeSaveCon;
import com.smhrd.controller.BoardCmtDeleteCon;
import com.smhrd.controller.BoardCmtListCon;
import com.smhrd.controller.BoardCmtWriteCon;
import com.smhrd.controller.BoardDeleteCon;
import com.smhrd.controller.BoardShowCon;
import com.smhrd.controller.BoardUpdateCon;
import com.smhrd.controller.BoardWriteCon;
import com.smhrd.controller.BuyProductCon;
import com.smhrd.controller.FollowCon;
import com.smhrd.controller.IdCheckCon;
import com.smhrd.controller.JoinCon;
import com.smhrd.controller.KakaoLoginCon;

import com.smhrd.controller.KakaoLogoutCon;

import com.smhrd.controller.LikeDeleteCon;
import com.smhrd.controller.LikeSaveCon;

import com.smhrd.controller.LoginCon;
import com.smhrd.controller.LogoutCon;
import com.smhrd.controller.NaverLoginCon;

import com.smhrd.controller.NaverLogoutCon;
import com.smhrd.controller.ProImgCon;
import com.smhrd.controller.ProfileEditCon;
import com.smhrd.controller.SnsJoinCon;
import com.smhrd.controller.UnFollowCon;



public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, command> list = new HashMap<String, command>();

	public void init(ServletConfig config) throws ServletException {
		list.put("KakaoLoginCon.do", new KakaoLoginCon());
		list.put("BoardWriteCon.do", new BoardWriteCon());
		list.put("BoardUpdateCon.do", new BoardUpdateCon());
		list.put("BoardDeleteCon.do", new BoardDeleteCon());
		list.put("BoardCmtWriteCon.do", new BoardCmtWriteCon());
		list.put("BoardCmtDeleteCon.do", new BoardCmtDeleteCon());
		list.put("NaverLoginCon.do", new NaverLoginCon());
		list.put("IdCheckCon.do", new IdCheckCon());
		list.put("JoinCon.do", new JoinCon());
		list.put("LikeSaveCon.do", new LikeSaveCon());
		list.put("LikeDeleteCon.do", new LikeDeleteCon());
		list.put("ProImgCon.do", new ProImgCon());
		list.put("LoginCon.do", new LoginCon());
		list.put("SnsJoinCon.do", new SnsJoinCon());
		list.put("ProfileEditCon.do", new ProfileEditCon());
		list.put("BoardShowCon.do", new BoardShowCon());
		list.put("CmtListCon.do", new BoardCmtListCon());

		list.put("BalLikeSaveCon.do", new BalLikeSaveCon());
		list.put("BalLikeDeleteCon.do", new BalLikeDeleteCon());
		

		list.put("CmtWriteCon.do", new BoardCmtWriteCon());

		list.put("KakaoLogout.do", new KakaoLogoutCon());
		list.put("NaverLogout.do", new NaverLogoutCon());

		// 로그아웃 컨트롤러
		list.put("LogoutCon.do", new LogoutCon());
		// 리워드 샵 컨트롤러
		list.put("buyProduct.do", new BuyProductCon());
		// 팔로우 관련 컨트롤러
		list.put("FollowCon.do", new FollowCon());
		list.put("UnFollowCon.do", new UnFollowCon());
		

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// FrontController

		System.out.println("[frontController]");

		// 어떤 요청이 들어왔는지 확인
		String reqURI = request.getRequestURI();
		System.out.println(reqURI);

		// ContextPath : 서버가 프로젝트를 찾는 이름
		String contextPath = request.getContextPath();
		System.out.println(contextPath);

		// substring메소드 사용해서 요청 값만 출력
		String path = reqURI.substring(contextPath.length() + 1);
		System.out.println(path);

		command con = list.get(path);
		String moveURL = con.execute(request, response);
		if (moveURL != null) {
			if (moveURL.contains("forward")) {
				moveURL = moveURL.substring("forward".length());
				RequestDispatcher rd = request.getRequestDispatcher(moveURL);
				rd.forward(request, response);
			} else {
				response.sendRedirect(moveURL);
			}
		}

	}

}
