package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ShopDTO {
	private String product_name;
	private int product_price;
	private String product_img;
	private String mem_id;
	private String buy_date;
	
	
	public ShopDTO(String product_name, String mem_id) {
		super();
		this.product_name = product_name;
		this.mem_id = mem_id;
	}


	public ShopDTO(int product_price, String mem_id) {
		super();
		this.product_price = product_price;
		this.mem_id = mem_id;
	}
	
	
	
	
}
