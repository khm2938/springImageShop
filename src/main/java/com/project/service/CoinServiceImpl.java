package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ChargeCoin;
import com.project.mapper.CoinMapper;

@Service 
public class CoinServiceImpl implements CoinService { 
 
	@Autowired
	private CoinMapper mapper;
	
	// 코인 충전 처리 
	@Transactional
	@Override
	public int charge(ChargeCoin chargeCoin) throws Exception {
		return mapper.charge(chargeCoin); 
	}

	@Override
	public List<ChargeCoin> list(int userNo) throws Exception {
		return mapper.list(userNo); 
	} 
 
} 