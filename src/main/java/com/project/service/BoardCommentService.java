package com.project.service;

import java.util.List;

import com.project.domain.BoardComment;

public interface BoardCommentService {

	int register(BoardComment comment) throws Exception;
	
	List<BoardComment> listByBoardNo(int boardNo) throws Exception;

	int modify(BoardComment comment) throws Exception;

	int remove(BoardComment comment) throws Exception;

	int removeAdmin(BoardComment comment) throws Exception;
	
}
