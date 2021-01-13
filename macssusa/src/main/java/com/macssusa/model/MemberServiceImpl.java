package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macssusa.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insert(MemberVO memberVo) {
		memberMapper.mInsert(memberVo);
	}

	@Override
	public MemberVO findById(String id) {
		return memberMapper.mfindById(id);
	}

	@Override
	public void memberUpdate(MemberVO memberVo) {
		memberMapper.mUpdate(memberVo);
	}

	@Override
	public void memberDelete(String id) {
		memberMapper.mDelete(id);
	}
	
	@Override
	public void enableMember(String id) {
		memberMapper.enableMember(id);	
	}

	@Override
	public void completelyDeleteById(String id) {
		memberMapper.completelyDeleteById(id);
		
	}

	@Override
	public void adminCreation() {
		memberMapper.adminCreation();
	}

	@Override
	public boolean isAdminExist() {
		int result = memberMapper.isAdminExist();
		if (result >= 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberMapper.getMemberList();
	}

	@Override
	public String getNicknameById(String id) {
		return memberMapper.getNicknameById(id);
	}


	
	

}
