package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.command.command;
import com.smhrd.model.BalVoteDTO;
import com.smhrd.model.BalanceDAO;
import com.smhrd.model.BalanceDTO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

public class BalVoteCon implements command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bal_seq = Integer.parseInt(request.getParameter("bal_seq"));
		String vote = request.getParameter("vote");
		int reward = Integer.parseInt(request.getParameter("reward"));
		BalanceDAO bdao = new BalanceDAO();
		HttpSession session = request.getSession();
		String mem_id = ((MemberDTO)session.getAttribute("member")).getMem_id();
		
		BalVoteDTO bvdto  = bdao.voteCheck(new BalVoteDTO(bal_seq, mem_id));
		
		if(Objects.isNull(bvdto) == true) {
			// 해당 밸런스 글에 투표 한적이 없을때
			bdao.voteInsert(new BalVoteDTO(bal_seq, mem_id, vote));
			new MemberDAO().plusReward(new MemberDTO(mem_id, reward));
		}else {
			 
			
			if(bvdto.getBal_vote().equals(vote)){
				// 투표 데이터가 있는데 투표할 위치와 데이터의 위치가 동일할때 
				bdao.voteDelte(new BalVoteDTO(bal_seq, mem_id));
				new MemberDAO().minusReward(new MemberDTO(mem_id, reward));
			}else {
				// 투표 데이터가 있는데 투표할 위치와 데이터의 위치가 다를때
				bdao.voteUpdate(new BalVoteDTO(bal_seq, mem_id, vote));
			}
		}
		
		BalanceDTO b =bdao.voteCount(new BalVoteDTO(bal_seq));
		System.out.println(b.getBal_left_count());
		System.out.println(b.getBal_right_count());
		
		Gson gson = new Gson();
		String json = gson.toJson(b);
		response.setContentType("text/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		return null;
	}

}
