package com.macssusa.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// 각 게시판 글쓰기 진입
	
	@RequestMapping(value="/board_macreview_write", method=RequestMethod.GET)
	public void getBoardWrite_MacReview(){
	}
	@RequestMapping(value="/board_addonreview_write", method=RequestMethod.GET)
	public void getBoardWrite_AddonReview(Model model) throws Exception {
	}
	@RequestMapping(value="/board_macquestion_write", method=RequestMethod.GET)
	public void getBoardWrite_MacQuestion(Model model) throws Exception {
	}
	@RequestMapping(value="/board_addonquestion_write", method=RequestMethod.GET)
	public void getBoardWrite_AddonQuestion(Model model) throws Exception {
	}
	
	// 게시물 작성
	@RequestMapping(value = "/board_macreview_write", method = RequestMethod.POST)
	public String writeBoard_MacReview(@ModelAttribute BoardVO boardVo, HttpSession session) throws UnknownHostException {
		
		// 새로 적용할 VO 만들기(기존의 VO는 일부 데이터가 빠져있으므로)
		BoardVO newBoardVo = new BoardVO();
		newBoardVo.setBnum(service.getNextNum());
		newBoardVo.setTitle(boardVo.getTitle());
		newBoardVo.setContent(boardVo.getContent());
		newBoardVo.setMemberid((String)session.getAttribute("sessId"));
		newBoardVo.setIp(Inet4Address.getLocalHost().getHostAddress());
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);

		service.writeBoard_MacReview(newBoardVo);
		return "redirect:/board/board_macreview";
	}
	@RequestMapping(value = "/board_addonreview_write", method = RequestMethod.POST)
	public String writeBoard_AddonReview(@ModelAttribute BoardVO boardVo, HttpSession session) throws UnknownHostException {
		
		// 새로 적용할 VO 만들기(기존의 VO는 일부 데이터가 빠져있으므로)
		BoardVO newBoardVo = new BoardVO();
		newBoardVo.setBnum(service.getNextNum());
		newBoardVo.setTitle(boardVo.getTitle());
		newBoardVo.setContent(boardVo.getContent());
		newBoardVo.setMemberid((String)session.getAttribute("sessId"));
		newBoardVo.setIp(Inet4Address.getLocalHost().getHostAddress());
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);

		service.writeBoard_AddonReview(newBoardVo);
		return "redirect:/board/board_addonreview";
	}
	@RequestMapping(value = "/board_macquestion_write", method = RequestMethod.POST)
	public String writeBoard_MacQuestion(@ModelAttribute BoardVO boardVo, HttpSession session) throws UnknownHostException {
		
		// 새로 적용할 VO 만들기(기존의 VO는 일부 데이터가 빠져있으므로)
		BoardVO newBoardVo = new BoardVO();
		newBoardVo.setBnum(service.getNextNum());
		newBoardVo.setTitle(boardVo.getTitle());
		newBoardVo.setContent(boardVo.getContent());
		newBoardVo.setMemberid((String)session.getAttribute("sessId"));
		newBoardVo.setIp(Inet4Address.getLocalHost().getHostAddress());
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);

		service.writeBoard_MacQuestion(newBoardVo);
		return "redirect:/board/board_macquestion";
	}
	@RequestMapping(value = "/board_addonquestion_write", method = RequestMethod.POST)
	public String writeBoard_AddonQuestion(@ModelAttribute BoardVO boardVo, HttpSession session) throws UnknownHostException {
		
		// 새로 적용할 VO 만들기(기존의 VO는 일부 데이터가 빠져있으므로)
		BoardVO newBoardVo = new BoardVO();
		newBoardVo.setBnum(service.getNextNum());
		newBoardVo.setTitle(boardVo.getTitle());
		newBoardVo.setContent(boardVo.getContent());
		newBoardVo.setMemberid((String)session.getAttribute("sessId"));
		newBoardVo.setIp(Inet4Address.getLocalHost().getHostAddress());
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);
		newBoardVo.setFilename1(null);

		service.writeBoard_AddonQuestion(newBoardVo);
		return "redirect:/board/board_addonquestion";
	}
	
	
}
