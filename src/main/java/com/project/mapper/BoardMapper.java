package com.project.mapper;

import java.util.List;

import com.project.domain.Board;

public interface BoardMapper {
	
	// 게시글 등록 처리
	public int register(Board board) throws Exception;

	// 게시글 목록 페이지 
	public List<Board> list() throws Exception;
	
	// 게시글 상세 조회
	public Board read(Board board) throws Exception;
	
	// 게시글 수정 처리
	public int modify(Board board) throws Exception;

	// 게시글 삭제 처리
	public int remove(Board board) throws Exception;
	
}
