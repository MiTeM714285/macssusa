package com.macssusa.controller;

import java.io.File;
import java.net.Inet4Address;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.macssusa.model.BoardService;
import com.macssusa.model.BoardVO;
import com.macssusa.model.CommentService;
import com.macssusa.model.CommentVO;
import com.macssusa.model.Page;

@Controller
@RequestMapping("/board/*") // 게시판 쪽 디렉토리 매핑
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	CommentService commentService;
	
	// 각 게시판 진입
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public void getBoardList(@RequestParam("btype") int btype, Model model) throws Exception {
		List<BoardVO> list = null;
		list = service.getBoardList(btype);
		model.addAttribute("list",list);
	}
	
	// 각 게시판 진입(페이징 추가)
	@RequestMapping(value="/board_page", method=RequestMethod.GET)
	public void getBoardListPage(@RequestParam("btype") int btype, @RequestParam("num") int num, Model model) throws Exception {

		Page page = new Page();
	
		page.setNum(num);
		page.setCount(service.getBoardCount(btype));  

		List<BoardVO> list = null;
		list = service.getBoardListPage(btype, page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("selected", num); // 현재 페이지(선택한 페이지)
	}
	
	// 각 게시판 진입(페이징+검색 추가)
	@RequestMapping(value="/board_page_search", method=RequestMethod.GET)
	public void getBoardListPageSearch(@RequestParam("btype") int btype, @RequestParam("num") int num, Model model,
			@RequestParam(value="searchType", required=false, defaultValue="title") String searchType,
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword) throws Exception {

		Page page = new Page();
	
		page.setNum(num);
		page.setCount(service.getBoardCountSearch(btype, searchType, keyword));
		
		// 검색 타입과 검색어 데이터
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<BoardVO> list = null;
		list = service.getBoardListPageSearch(btype, page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("selected", num); // 현재 페이지(선택한 페이지)
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
			newBoardVo.setFilename2(null);
			newBoardVo.setFilename3(null);
			newBoardVo.setFilename4(null);
			newBoardVo.setFilename5(null);
			
			String saveDir = request.getSession().getServletContext().getRealPath("/");
			saveDir += "resources/img/";
			MultipartFile f1 = boardVo.getUploadFile1();
			MultipartFile f2 = boardVo.getUploadFile2();
			MultipartFile f3 = boardVo.getUploadFile3();
			MultipartFile f4 = boardVo.getUploadFile4();
			MultipartFile f5 = boardVo.getUploadFile5();
			String fileName1 = "", fileName2 = "", fileName3 = "", fileName4 = "", fileName5 = "";
			if(!f1.isEmpty()) {
				String orifileName = f1.getOriginalFilename(); // 원래 파일명 이름 얻기
				UUID uuid = UUID.randomUUID(); // 파일명 랜덤지정 - 이름 중복 방지
				fileName1 = uuid+"."+orifileName; // 원래파일명 + 랜덤값 합치기
				//f.transferTo(new File(saveDir+fileName));
				FileCopyUtils.copy(f1.getBytes(), new File(saveDir+fileName1)); // f.transferTo(new File(saveDir+fileName)); 와 같은 로직
				newBoardVo.setFilename1(fileName1);
			}
			if(!f2.isEmpty()) {
				String orifileName = f2.getOriginalFilename(); // 원래 파일명 이름 얻기
				UUID uuid = UUID.randomUUID(); // 파일명 랜덤지정 - 이름 중복 방지
				fileName2 = uuid+"."+orifileName; // 원래파일명 + 랜덤값 합치기
				//f.transferTo(new File(saveDir+fileName));
				FileCopyUtils.copy(f2.getBytes(), new File(saveDir+fileName2)); // f.transferTo(new File(saveDir+fileName)); 와 같은 로직
				newBoardVo.setFilename2(fileName2);
			}
			if(!f3.isEmpty()) {
				String orifileName = f3.getOriginalFilename(); // 원래 파일명 이름 얻기
				UUID uuid = UUID.randomUUID(); // 파일명 랜덤지정 - 이름 중복 방지
				fileName3 = uuid+"."+orifileName; // 원래파일명 + 랜덤값 합치기
				//f.transferTo(new File(saveDir+fileName));
				FileCopyUtils.copy(f3.getBytes(), new File(saveDir+fileName3)); // f.transferTo(new File(saveDir+fileName)); 와 같은 로직
				newBoardVo.setFilename3(fileName3);
			}
			if(!f4.isEmpty()) {
				String orifileName = f4.getOriginalFilename(); // 원래 파일명 이름 얻기
				UUID uuid = UUID.randomUUID(); // 파일명 랜덤지정 - 이름 중복 방지
				fileName4 = uuid+"."+orifileName; // 원래파일명 + 랜덤값 합치기
				//f.transferTo(new File(saveDir+fileName));
				FileCopyUtils.copy(f4.getBytes(), new File(saveDir+fileName4)); // f.transferTo(new File(saveDir+fileName)); 와 같은 로직
				newBoardVo.setFilename4(fileName4);
			}
			if(!f5.isEmpty()) {
				String orifileName = f5.getOriginalFilename(); // 원래 파일명 이름 얻기
				UUID uuid = UUID.randomUUID(); // 파일명 랜덤지정 - 이름 중복 방지
				fileName5 = uuid+"."+orifileName; // 원래파일명 + 랜덤값 합치기
				//f.transferTo(new File(saveDir+fileName));
				FileCopyUtils.copy(f5.getBytes(), new File(saveDir+fileName5)); // f.transferTo(new File(saveDir+fileName)); 와 같은 로직
				newBoardVo.setFilename5(fileName5);
			}

			
			int type = Integer.parseInt(request.getParameter("btype")); // 게시판 종류가 어떤건지 파악하기위한
			newBoardVo.setBtype(type);
			service.writeBoard(newBoardVo);
			return "redirect:/board/board?btype="+type;
		}
		
	// 게시글 조회
	@RequestMapping(value="/board_view", method=RequestMethod.GET)
	public void getBoardView(int bnum, int btype, Model model, HttpSession session) throws Exception {
		BoardVO boardVo = service.getBoardView(bnum, btype);
		model.addAttribute("view",boardVo);
		
		// 조회수1증가 (로그인상태에서 자신의글에 조회할시 조회수는 올라가지 않음)
		String sessId = null;
		if ((String)session.getAttribute("sessId") != null) {
			sessId = (String)session.getAttribute("sessId");
		}
		String memberId = boardVo.getMemberid();
		if (sessId == null || (sessId != null && !memberId.equals(sessId))) {
			service.hitcountUp(bnum);
		}
		
		// 댓글 조회
		List<CommentVO> comment = null;
		comment = commentService.getCommentList(bnum);
		model.addAttribute("comment", comment);
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
