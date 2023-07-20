package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter

@AllArgsConstructor

@NoArgsConstructor
public class MemberDTO {
	@NonNull private String mem_id;
	@NonNull private String mem_pw;
	@NonNull private String mem_img;
	private String mem_reward;
	@NonNull private String mem_email;
	private String login_type;
	
	public MemberDTO(String mem_id, String mem_email) {
		
		this.mem_id = mem_id;
		this.mem_email = mem_email;
		
	}

	
	
	public MemberDTO(String mem_id, String mem_pw, String mem_img, String mem_email,String login_type) {
		
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_img = mem_img;
		this.mem_email = mem_email;
		this.login_type = login_type;
	}



	public MemberDTO(String mem_id, String mem_pw, String mem_img, String mem_email) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_img = mem_img;
		this.mem_email = mem_email;
	}



	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}







	








	

	
	
	
	
	
	
}
