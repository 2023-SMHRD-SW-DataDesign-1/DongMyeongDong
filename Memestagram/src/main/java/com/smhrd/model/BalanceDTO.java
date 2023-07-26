package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class BalanceDTO {
	
	private int bal_seq;
	@NonNull private String mem_id;
	@NonNull private String bal_content;
	private String bal_date;
	private int bal_like;
	@NonNull private String bal_img;
	private String bal_vid;
	private String bal_left;
	private int bal_left_count;
	private String bal_right;
	private int bal_right_count;
	@NonNull private int bal_reward;
	@NonNull private String bal_time;
	
	
	public BalanceDTO(int bal_seq, @NonNull String mem_id) {
		this.bal_seq = bal_seq;
		this.mem_id = mem_id;
	}
	

	
	
}
