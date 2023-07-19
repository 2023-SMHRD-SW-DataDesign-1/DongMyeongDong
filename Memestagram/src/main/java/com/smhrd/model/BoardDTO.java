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

public class BoardDTO {

	 private int board_seq;
	 @NonNull private String mem_id;
	 @NonNull private String board_content;
	 private String board_date;
	 private String board_like;
	 @NonNull private String board_img;
	 private String board_vid;
	
}
