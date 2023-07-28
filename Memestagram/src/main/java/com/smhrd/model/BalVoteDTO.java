package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BalVoteDTO {
	private int bal_seq;
	private String mem_id;
	private String bal_vote;
	
	
	public BalVoteDTO(int bal_seq, String mem_id) {
		super();
		this.bal_seq = bal_seq;
		this.mem_id = mem_id;
	}


	public BalVoteDTO(int bal_seq) {
		super();
		this.bal_seq = bal_seq;
	}
	
	
}


