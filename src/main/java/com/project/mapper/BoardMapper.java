package com.project.mapper;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;

public interface BoardMapper {
	
	// 게시글 등록 처리
	public int register(Board board) throws Exception;

	// 게시글 목록 페이지 
	public List<Board> list() throws Exception;
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다. 
	public List<Board> list(PageRequest pageRequest) throws Exception;
	
	// 게시글 상세 조회
	public Board read(Board board) throws Exception;
	
	// 게시글 수정 처리
	public int modify(Board board) throws Exception;

	// 게시글 삭제 처리
	public int remove(Board board) throws Exception;

	// 게시글 전체 건수 조회
	public int count() throws Exception;
	
	
}
