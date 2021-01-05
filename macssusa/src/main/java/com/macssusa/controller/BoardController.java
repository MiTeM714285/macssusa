package com.macssusa.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macssusa.model.BoardService;
import com.macssusa.model.BoardVO;

@Controller
@RequestMapping("/board/*") // 게시판 쪽 디렉토리 매핑
public class BoardController {
	
	@Inject
	BoardService service;
	
	// 각 게시판 진입
	
	@RequestMapping(value="/board_macreview", method=RequestMethod.GET)
	public void getBoardList_MacReview(Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.getBoardList_MacReview();
		model.addAttribute("list",list);
	}
	@RequestMapping(value="/board_addonreview", method=RequestMethod.GET)
	public void getBoardList_AddonReview(Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.getBoardList_AddonReview();
		model.addAttribute("list",list);
	}
	@RequestMapping(value="/board_macquestion", method=RequestMethod.GET)
	public void getBoardList_MacQuestion(Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.getBoardList_MacQuestion();
		model.addAttribute("list",list);
	}
	@RequestMapping(value="/board_addonquestion", method=RequestMethod.GET)
	public void getBoardList_AddonQuestion(Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.getBoardList_AddonQuestion();
		model.addAttribute("list",list);
	}
}
