package com.macssusa.mapper;

import com.macssusa.model.MemberVO;

public interface MemberMapper {
	public void mInsert(MemberVO memberVo); // 추가
	public MemberVO mfindById(String id); // 상세보기
	
	
}
