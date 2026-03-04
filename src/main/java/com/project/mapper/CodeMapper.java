package com.project.mapper;

import java.util.List;

import com.project.common.domain.CodeLabelValue;
import com.project.domain.ChargeCoin;
import com.project.domain.PayCoin;


public interface CodeMapper {
	// 등록 처리 
	public void create(ChargeCoin chargeCoin) throws Exception; 
	// 그룹코드 목록 조회 
	public List<CodeLabelValue> getCodeGroupList() throws Exception; 
	// 코드리스트 조회
	public List<CodeLabelValue> getCodeList(String groupCode) throws Exception;
	
	
	// 상세 페이지 
	
	// 삭제 처리 
	
	// 수정 처리 
	
}
