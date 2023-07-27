package com.smhrd.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor

public class BalCmtDTO {
	private int bal_cmt_seq;
	@NonNull private int bal_seq;
	@NonNull private String mem_id;
    @NonNull private String bal_cmt_content;
	private String bal_cmt_date;
	private int bal_cmt_count;
	private String mem_img;

	
	public BalCmtDTO(@NonNull int bal_seq, @NonNull String mem_id) {
		super();
		this.bal_seq = bal_seq;
		this.mem_id = mem_id;
	}
	
	
}
