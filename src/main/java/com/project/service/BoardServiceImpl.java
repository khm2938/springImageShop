package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Board;
import com.project.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Transactional
	@Override
	public int register(Board board) throws Exception {
		return mapper.register(board);
	}

	// 게시글 목록 페이지 
	@Override 
	public List<Board> list() throws Exception {  
	return mapper.list(); 
	}
	
	// 게시글 상세 조회
	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}
	
	// 게시글 수정 처리
	@Override
	public int modify(Board board) throws Exception {
		return mapper.modify(board);
	}

	// 게시글 삭제 처리
	@Override
	public int remove(Board board) throws Exception {
		return mapper.remove(board);
	} 
}
