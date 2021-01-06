package com.macssusa.mapper;

import java.util.List;

import com.macssusa.model.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getBoardList_MacReview();
	public List<BoardVO> getBoardList_AddonReview();
	public List<BoardVO> getBoardList_MacQuestion();
	public List<BoardVO> getBoardList_AddonQuestion();
	
	public int getNextNum();

	public void writeBoard_MacReview(BoardVO boardVo);
	public void writeBoard_AddonReview(BoardVO boardVo);
	public void writeBoard_MacQuestion(BoardVO boardVo);
	public void writeBoard_AddonQuestion(BoardVO boardVo);
}
