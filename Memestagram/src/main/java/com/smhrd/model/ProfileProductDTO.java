package com.smhrd.model;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ProfileProductDTO {

	private String product_name;
	private String product_img;
	private String mem_id;
	
	
	
	
	public ProfileProductDTO(String product_name, String product_img) {
		this.product_name = product_name;
		this.product_img = product_img;
	}
	
	
	

	
	
}
