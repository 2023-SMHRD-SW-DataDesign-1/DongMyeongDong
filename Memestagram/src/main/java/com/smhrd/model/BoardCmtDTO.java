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

public class BoardCmtDTO {
	

	private int board_cmt_seq;
	@NonNull private int board_seq;
	@NonNull private String mem_id;
    @NonNull private String board_cmt_content;
	private String board_cmt_date;
	private int cmt_count;
	private String mem_img;
	
	public BoardCmtDTO(int board_cmt_seq) {
		this.board_cmt_seq = board_cmt_seq;
	}

	public BoardCmtDTO(@NonNull int board_seq, @NonNull String mem_id) {
		super();
		this.board_seq = board_seq;
		this.mem_id = mem_id;
	}

	
	

	
	
	
	

	
	
}
