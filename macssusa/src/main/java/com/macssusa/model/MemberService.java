package com.macssusa.model;

public interface MemberService {
	
	public void insert(MemberVO memberVo);
	public MemberVO findById(String id);
	public void memberUpdate(MemberVO memberVo);
	public void memberDelete(String id); // 회원탈퇴
}
