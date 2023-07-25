package com.smhrd.model;

import java.util.List;

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
	@NonNull private String mem_id;
	@NonNull private String mem_pw;
	@NonNull private String mem_img;
	private int mem_reward;
	@NonNull private String mem_email;
	private String login_type;
	
	
	public MemberDTO(String mem_id, String mem_email,String login_type) {
		
		this.mem_id = mem_id;
		this.mem_email = mem_email;
		this.login_type = login_type;
		
	}

	
	
	
	public MemberDTO(String mem_id, String mem_pw, String mem_img, String mem_email,String login_type) {
		
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_img = mem_img;
		this.mem_email = mem_email;
		this.login_type = login_type;
	}



	







	public MemberDTO(@NonNull String mem_id, @NonNull String mem_img, @NonNull String mem_email, String login_type) {
		
		this.mem_id = mem_id;
		this.mem_img = mem_img;
		this.mem_email = mem_email;
		this.login_type = login_type;
	}




	public MemberDTO(@NonNull String mem_id, @NonNull String mem_pw) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}







	








	

	
	
	
	
	
	
}
