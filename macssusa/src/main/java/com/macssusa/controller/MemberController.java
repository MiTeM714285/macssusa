package com.macssusa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
