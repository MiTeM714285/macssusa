package com.macssusa.model;

public interface MemberDAO {
	
	public void mdao_insert(MemberVO memberVo);
	public MemberVO mdao_findById(String id);

}
