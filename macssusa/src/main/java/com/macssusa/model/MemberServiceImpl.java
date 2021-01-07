package com.macssusa.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macssusa.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insert(MemberVO memberVo) {
		// TODO Auto-generated method stub
		memberMapper.mInsert(memberVo);
	}

	@Override
	public MemberVO findById(String id) {
		// TODO Auto-generated method stub
		return memberMapper.mfindById(id);
	}

	@Override
	public void memberUpdate(MemberVO memberVo) {
		// TODO Auto-generated method stub
		memberMapper.mUpdate(memberVo);
	}
	
	

}
