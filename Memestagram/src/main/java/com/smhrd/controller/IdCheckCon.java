package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.MemberDAO;

public class IdCheckCon implements command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		String checkId = new MemberDAO().idCheck(id);

		if (checkId == null || checkId.equals("")) {
			checkId = "Y";
		}

		Gson gson = new Gson();
		String json = gson.toJson(checkId);
		System.out.println(json);

		// Json으로 응답해주기
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

}
