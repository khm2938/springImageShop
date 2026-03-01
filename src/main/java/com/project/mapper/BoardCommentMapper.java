package com.project.mapper;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.BoardComment;

public interface BoardCommentMapper {
	
		// 댓글 등록 처리
		public int register(BoardComment comment) throws Exception;

		// 댓글 목록 페이지 
		public List<BoardComment> list() throws Exception;
		
		// 댓글 상세 조회
		public BoardComment read(BoardComment comment) throws Exception;
		
		// 댓글 수정 처리
		public int modify(BoardComment comment) throws Exception;

		// 댓글 삭제 처리
		public int remove(BoardComment comment) throws Exception;

		// 댓글 전체 건수 조회
		public int count(PageRequest comment) throws Exception;
}
