package com.macssusa.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.macssusa.model.BoardService;
import com.macssusa.model.BoardVO;

@Controller
@RequestMapping("/board/*") // 게시판 쪽 디렉토리 매핑
public class BoardController {
	
	@Autowired
	BoardService service;
	
	// 각 게시판 진입
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public void getBoardList(@RequestParam("btype") int btype, Model model) throws Exception {
		List<BoardVO> list = null;
			list = service.getBoardList(btype);
			model.addAttribute("list",list);
	}
	
	// 게시글 작성 진입
	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public void getWrite() throws Exception {
	
	}
	
	// 게시글 작성
		@RequestMapping(value = "/board_write", method = RequestMethod.POST)
		public String writeBoard(@ModelAttribute BoardVO boardVo, HttpSession session, HttpServletRequest request) throws Exception {
			
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
			
			int type = Integer.parseInt(request.getParameter("btype")); // 게시판 종류가 어떤건지 파악하기위한
			newBoardVo.setBtype(type);
			service.writeBoard(newBoardVo);
			return "redirect:/board/board?btype="+type;
		}
		
	// 게시글 조회
	@RequestMapping(value="/board_view", method=RequestMethod.GET)
	public void getBoardView(int bnum, int btype, Model model) throws Exception {
		BoardVO boardVo = service.getBoardView(bnum, btype);
		model.addAttribute("view",boardVo);
	}
	
	// 게시글 수정 진입
	@RequestMapping(value="/board_update", method=RequestMethod.GET)
	public void getModify(int bnum, int btype, Model model) throws Exception {
		BoardVO boardVo = service.getBoardView(bnum, btype);
		model.addAttribute("view",boardVo);
	}
	
	@RequestMapping(value="/board_update", method=RequestMethod.POST)
	public String updateBoard(BoardVO boardVo) throws Exception {
		service.updateBoard(boardVo);
		return "redirect:/board/board_view?bnum="+boardVo.getBnum()+"&btype="+boardVo.getBtype();
	}
	
	@RequestMapping(value="/board_delete", method=RequestMethod.GET)
	public String deleteBoard(int bnum, int btype) throws Exception {
		service.deleteBoard(bnum);
		return "redirect:/board/board?bnum="+bnum+"&btype="+btype;
	}
}
