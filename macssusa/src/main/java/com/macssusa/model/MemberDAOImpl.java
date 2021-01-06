package com.macssusa.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.macssusa.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void mdao_insert(MemberVO memberVo) {
		// TODO Auto-generated method stub
		memberMapper.mInsert(memberVo);
	}
	
	@Override
	public MemberVO mdao_findById(String id) {
		// TODO Auto-generated method stub
		return memberMapper.mfindById(id);
	}

}
