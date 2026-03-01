package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardComment {
	
	private int commentNo;
	private int boardNo;
	private String commenter;
	private String content;
	private Date regDate;
	
}
