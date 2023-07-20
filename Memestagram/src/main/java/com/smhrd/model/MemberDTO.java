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
public class MemberDTO {
	private String mem_id;
	private String mem_pw;
	private String mem_img;
	private String mem_reward;
	private String mem_email;
	private String login_type;
	
	public MemberDTO(@NonNull String mem_id, @NonNull String mem_email) {
		
		this.mem_id = mem_id;
		this.mem_email = mem_email;
		
	}

	
	
	public MemberDTO(@NonNull String mem_id, @NonNull String mem_img, @NonNull String mem_email, String login_type) {
		super();
		this.mem_id = mem_id;
		this.mem_img = mem_img;
		this.mem_email = mem_email;
		this.login_type = login_type;
	}

	

	
	
	
	
	
	
}
