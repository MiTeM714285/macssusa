package com.macssusa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.macssusa.model.MemberService;
import com.macssusa.model.MemberVO;


@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@GetMapping
	public String registration() {
		return "member/registration";
	}
	
	@PostMapping("registration") // 등록 후 리스트로 리다이렉트
	public String insert(@ModelAttribute MemberVO memberVo) {
		mService.insert(memberVo);
		return "member/login";
	}
	
	//ID중복체크 form으로
	@GetMapping("idCheck")
	public void idCheck() {
	}
	
	// id 중복확인
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(String id) {
		MemberVO member = mService.findById(id);
		String result = "";
		if (member == null) {
			result = "success";
		} else {
			result = "fail";
		}
		return result; // @ResponseBody는 문자열을 return하게 해줌
	}
	
	// 로그인페이지로 가기
	@GetMapping("login")
	public void login() {
		
	}
	
	//로그인체크
	@PostMapping("loginCheck")
	@ResponseBody
	public String login(HttpSession session, String id, String password) {
		String result = "";
		
		MemberVO member = mService.findById(id);
		if(member == null) { // 회원이 아닐경우
			result = "fail";
		} else if(member.getAvailable() == 0) {
			result = "notAvailable"; // 탈퇴 및 관리자가 차단
		} else if(member.getPassword().equals(password)) { // 회원일 경우
			boolean isAdmin = false;
			if(member.getIsmanager() == 1) {
				isAdmin = true;
			} else {
				isAdmin = false;
			}
			session.setAttribute("sessId", id); // 세션에 id 추가
			session.setAttribute("isAdmin", isAdmin); // 세션에 관리자 판단 추가
			result = "success";
		} else { // 비밀번호 불일치
			result = "passfail";
		}
		return result; // @ResponseBody는 문자열을 return하게 해줌
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
	
	@GetMapping("memberUpdate")
	public void getMemberUpdate(HttpSession session, Model model) {
		String id = (String)session.getAttribute("sessId");
		MemberVO memberVo = mService.findById(id);
		model.addAttribute("view",memberVo);
	}
	
	@PostMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVo) {
		mService.memberUpdate(memberVo);
		return "redirect:/";
	}
	
	@GetMapping("memberDelete")
	public String memberDelete(HttpSession session) {
		String id = (String)session.getAttribute("sessId");
		session.invalidate();
		mService.memberDelete(id);
		return "redirect:/";
	}
	
	@GetMapping("memberList")
	public void getMemberList(Model model) {
		List<MemberVO> list = null;
		list = mService.getMemberList();
		model.addAttribute("memberList",list);
	}
	
	@GetMapping("enableMember")
	public String enableMember(@RequestParam("id") String id) {
		mService.enableMember(id);
		return "redirect:/member/memberList";
	}
	@GetMapping("disableMember")
	public String disableMember(@RequestParam("id") String id) {
		mService.memberDelete(id);
		return "redirect:/member/memberList";
	}
	@GetMapping("completelyDeleteMember")
	public String completelyDeleteMember(@RequestParam("id") String id) {
		mService.completelyDeleteById(id);
		return "redirect:/member/memberList";
	}
}