package com.project.common.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.common.security.domain.CustomUser;
import com.project.domain.Member;
import com.project.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		log.info("Load User By userId : " + userId); 
		 
		Member m = new Member();
		m.setUserId(userId);
		Member member = null;
		try {
			member = memberMapper.readByUserId(m);
			log.info("queried by member mapper: " + member); 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		 
		return member == null ? null : new CustomUser(member); 
	}

}
