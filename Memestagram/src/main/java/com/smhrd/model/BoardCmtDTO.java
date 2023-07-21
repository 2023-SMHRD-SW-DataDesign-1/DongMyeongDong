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
	
	public BoardCmtDTO(int board_cmt_seq) {
		this.board_cmt_seq = board_cmt_seq;
	}
	

	
	
}
