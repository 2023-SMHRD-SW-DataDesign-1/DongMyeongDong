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
		
// Member_info테이블에 속하는 필드
@NonNull private String mem_id;
@NonNull private String mem_pw;
		 private String mem_pw2;
		 private String mem_img;
		 private int mem_reward;
		 private int boardcount;
	
// Follow테이블에 속하는 필드	
		 private int follower;
		 private int following;
	
// Board테이블에 속하는 필드		
		 private String board_img;
		 
// Product_List테이블에 속하는 테이블
		 private String product_name;
	
	
	
	
	public ProfileDTO(@NonNull String mem_id) {
		super();
		this.mem_id = mem_id;
	}
		
	
	
	
	



	
	
}
