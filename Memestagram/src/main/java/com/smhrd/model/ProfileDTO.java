package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
public class ProfileDTO {
	
	@NonNull String mem_id;
	@NonNull private int mem_reward;
	@NonNull private String mem_img;
	@NonNull private String following;
	@NonNull private String follower;
	private String board;

}
