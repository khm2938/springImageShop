package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.Notice;
import com.project.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	// 공지사항 등록 처리
	@Override
	public int register(Notice notice) throws Exception {
		return mapper.register(notice);
	}
	
	// 공지사항 목록 페이지 
	@Override
	public List<Notice> list() throws Exception {
		return mapper.list();
	}
	
	// 공지사항 상세 페이지 
	@Override
	public Notice read(Notice notice) throws Exception {
		return mapper.read(notice);
	}
	
	// 공지사항 수정 처리
	@Override
	public int modify(Notice notice) throws Exception {
		return mapper.modify(notice);
	}
	
	// 공지사항 삭제 처리
	@Override
	public int remove(Notice notice) throws Exception {
		return mapper.remove(notice);
	}
	
	
}
