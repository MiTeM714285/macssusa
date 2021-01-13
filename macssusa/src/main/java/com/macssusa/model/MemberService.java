package com.macssusa.model;

import java.util.List;

public interface MemberService {
	
	public void insert(MemberVO memberVo);
	public MemberVO findById(String id);
	public void memberUpdate(MemberVO memberVo);
	public void memberDelete(String id); // 회원탈퇴
	public void enableMember(String id); // 회원 재활성화
	
	public void adminCreation();
	public boolean isAdminExist();
	public List<MemberVO> getMemberList();	
	public void completelyDeleteById(String id);
	public String getNicknameById(String id);
}
