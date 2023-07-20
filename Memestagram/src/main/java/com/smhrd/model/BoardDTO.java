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
	 @NonNull private String board_writer;
	 @NonNull private String board_content;
	 private String board_date;
	 private String board_like;
	 @NonNull private String board_img;
	 private String board_vid;
	 
	public BoardDTO(@NonNull String board_content, @NonNull String board_img) {
		this.board_content = board_content;
		this.board_img = board_img;
	}

	public BoardDTO(@NonNull String board_writer, @NonNull String board_content, String board_date, String board_like,
			@NonNull String board_img) {
		this.board_writer = board_writer;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_like = board_like;
		this.board_img = board_img;
	}
	
	
	
}
