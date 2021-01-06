package com.macssusa.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mdao;

	@Override
	public void insert(MemberVO memberVo) {
		// TODO Auto-generated method stub
		mdao.mdao_insert(memberVo);
	}

	@Override
	public MemberVO findById(String id) {
		// TODO Auto-generated method stub
		return mdao.mdao_findById(id);
	}
	
	

}
