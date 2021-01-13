package com.macssusa.mapper;

import java.util.List;

import com.macssusa.model.CommentVO;

public interface CommentMapper {
	// 댓글 조회
	public List<CommentVO> getCommentList(int bnum) throws Exception;
	
	// 댓글수
	public int getCommentCount(int bnum) throws Exception;

	// 댓글 쓰기
	public void writeComment(CommentVO commentVo) throws Exception;
	
	// 한 댓글 가져오기
	public CommentVO getCommentByCnum(int cnum) throws Exception;

	// 댓글 수정
	public void updateComment(CommentVO commentVo) throws Exception;

	// 댓글 삭제
	public void deleteComment(int cnum) throws Exception;
	
	public int getNextNum();
	
	public List<CommentVO> getDeletedCommentList();
	public void completelyDeleteByCnum(int cnum);
}
