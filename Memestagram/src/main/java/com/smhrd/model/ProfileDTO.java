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
public class ProfileDTO {
		
	
@NonNull	private String mem_id;
@NonNull	private String mem_pw;
	private String mem_pw2;

	private String mem_img;
	private int mem_reward;
	
	private int follower;
	private int following;
	
	private int boardcount;
	private String boardcontent;
	
	
		
	
	
	
	



	
	
}
