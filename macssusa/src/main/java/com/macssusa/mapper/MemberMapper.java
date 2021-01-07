package com.macssusa.mapper;

import com.macssusa.model.MemberVO;

public interface MemberMapper {
	public void mInsert(MemberVO memberVo); // 추가
	public MemberVO mfindById(String id); // 상세보기
	public void mUpdate(MemberVO memberVo); // 회원정보 수정.
	public void mDelete(String id); // 회원탈퇴
	
}
