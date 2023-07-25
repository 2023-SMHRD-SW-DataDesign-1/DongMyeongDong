package com.smhrd.model;

import java.util.ArrayList;

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
	private int mem_reward;
	@NonNull private String mem_img;
	private int following;
	private int follower;
	private int boardcount;
	@NonNull private String boardcontent;
	
	public ProfileDTO() {
		
	}

	public ProfileDTO(@NonNull String mem_id) {
		super();
		this.mem_id = mem_id;
	}
	
	

}
