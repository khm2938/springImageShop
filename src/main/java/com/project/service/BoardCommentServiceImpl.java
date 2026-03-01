package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.BoardComment;
import com.project.mapper.BoardCommentMapper;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentMapper mapper;
	
	@Transactional
	@Override
	public int register(BoardComment comment) throws Exception {
		return mapper.register(comment);
	}

	@Override
    public List<BoardComment> listByBoardNo(int boardNo) throws Exception {
        return mapper.listByBoardNo(boardNo);
    }
	
	@Transactional
	@Override
	public int modify(BoardComment comment) throws Exception {
		return mapper.modify(comment);
	}
	
	@Transactional
	@Override
	public int remove(BoardComment comment) throws Exception {
	    return mapper.remove(comment);
	}
	
	@Transactional
	@Override
	public int removeAdmin(BoardComment comment) throws Exception {
	    return mapper.removeAdmin(comment);
	}

	
}
