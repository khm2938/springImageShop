package com.project.service;

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

}
