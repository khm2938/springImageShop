package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.common.domain.PageRequest;
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
	
	// 페이징 요청 정보를 매개 변수로 받아 페이징 처리를 한 게시글 목록을 반환한다. 
		@Override
		public List<Board> list(PageRequest pageRequest) throws Exception {
			return mapper.list(pageRequest);
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
	
	// 게시글 전체 건수 조회
	@Override
	public int count() throws Exception {
		return mapper.count();
	}

	
}
