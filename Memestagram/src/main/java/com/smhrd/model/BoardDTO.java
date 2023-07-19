package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class BoardDTO {

	 private int board_seq;
	 @NonNull private String mem_id;
	 @NonNull private String board_contnent;
	 @NonNull private String board_date;
	 @NonNull private String board_img;
	 private String board_vid;
	
}
