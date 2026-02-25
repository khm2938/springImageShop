package com.project.service;

import java.util.List;

import com.project.domain.Member;

public interface MemberService {
	// 등록 처리
	public int register(Member member) throws Exception;
	// 목록 페이지 
	public List<Member> list() throws Exception;
	// 상세 페이지 
	public Member read(Member member) throws Exception;
	// 수정 처리 
	public int modify(Member member) throws Exception;
	// 삭제 처리
	public int remove(Member member) throws Exception;
	// 최초 관리자 생성 페이지
	public int countAll()throws Exception;
	// 최초 관리자 생성
	public void setupAdmin(Member member) throws Exception;

}
