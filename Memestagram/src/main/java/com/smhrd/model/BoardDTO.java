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
	 private int board_likes;
	 @NonNull private String board_img;
	 private String board_vid;
	 private String mem_img;
	 private int board_cmt_cnt;
	 private String checklike;
	 private String checkFollow;
	 
	public BoardDTO(@NonNull String board_content, @NonNull String board_img) {
		this.board_content = board_content;
		this.board_img = board_img;
	}

	public BoardDTO(@NonNull String mem_id, @NonNull String board_content, String board_date, int board_like,
			@NonNull String board_img) {
		this.mem_id = mem_id;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_likes = board_like;
		this.board_img = board_img;
	}

	public BoardDTO(int board_seq, @NonNull String mem_id) {
		this.board_seq = board_seq;
		this.mem_id = mem_id;
	}

	public BoardDTO(int board_seq, @NonNull String mem_id, @NonNull String board_content, String board_date,
			int board_likes, @NonNull String board_img, String board_vid) {
		super();
		this.board_seq = board_seq;
		this.mem_id = mem_id;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_likes = board_likes;
		this.board_img = board_img;
		this.board_vid = board_vid;
	}

	
	
	

	
}
