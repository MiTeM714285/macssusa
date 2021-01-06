package com.macssusa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		} else if(member.getPassword().equals(password)) { // 회원일 경우
			session.setAttribute("sessId", id); // 세션에 id 추가
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

}
