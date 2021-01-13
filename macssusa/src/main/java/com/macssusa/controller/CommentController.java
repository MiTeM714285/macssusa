package com.macssusa.controller;

import java.net.Inet4Address;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.macssusa.model.BoardService;
import com.macssusa.model.CommentService;
import com.macssusa.model.CommentVO;

@Controller
@RequestMapping("/comment/*") // 코멘트 쪽 디렉토리 매핑
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	BoardService boardService;
	
	// 댓글 작성
	@RequestMapping(value = "/writeComment", method = RequestMethod.POST)
	public String posttWirte(CommentVO commentVo, HttpSession session, HttpServletRequest request) throws Exception {
		
		CommentVO newCommentVo = new CommentVO();
		newCommentVo.setCnum(commentService.getNextNum());
		newCommentVo.setContent(commentVo.getContent());
		newCommentVo.setMemberid((String)session.getAttribute("sessId"));
		newCommentVo.setBnum(commentVo.getBnum());
		newCommentVo.setIp(Inet4Address.getLocalHost().getHostAddress());
		
		int type = Integer.parseInt(request.getParameter("btype")); // 게시판 종류가 어떤건지 파악하기위한
		System.out.println(type);
	    
	    commentService.writeComment(newCommentVo);
	    boardService.replyCountUp(commentVo.getBnum());

	    return "redirect:/board/board_view?bnum=" + commentVo.getBnum() + "&btype=" + type;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/comment_delete", method = RequestMethod.GET)
	public String deleteComment(int cnum, int bnum, int btype) throws Exception {
		//CommentVO commentVo = commentService.getCommentByCnum(cnum);
		commentService.deleteComment(cnum);
		boardService.replyCountDown(bnum);
		return "redirect:/board/board_view?bnum=" + bnum + "&btype=" + btype;
	}
	

	
}
