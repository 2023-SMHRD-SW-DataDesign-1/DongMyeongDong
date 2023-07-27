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
	@NonNull private String bal_left;
	private int bal_left_count;
	@NonNull private String bal_right;
	private int bal_right_count;
	private int bal_reward;
	@NonNull private String bal_time;
	private String likecheck;
	
	
	public BalanceDTO(int bal_seq, @NonNull String mem_id) {
		this.bal_seq = bal_seq;
		this.mem_id = mem_id;
	}


	public BalanceDTO(@NonNull String mem_id, @NonNull String bal_content, @NonNull String bal_img,
			@NonNull String bal_left, @NonNull String bal_right, int bal_reward, @NonNull String bal_time) {
		this.mem_id = mem_id;
		this.bal_content = bal_content;
		this.bal_img = bal_img;
		this.bal_left = bal_left;
		this.bal_right = bal_right;
		this.bal_reward = bal_reward;
		this.bal_time = bal_time;
	}
	

	
	
	
}
