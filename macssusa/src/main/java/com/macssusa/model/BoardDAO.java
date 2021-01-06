package com.macssusa.model;

import java.util.List;

public interface BoardDAO {
	
	public List<BoardVO> bdao_getBoardList_MacReview();
	public List<BoardVO> bdao_getBoardList_AddonReview();
	public List<BoardVO> bdao_getBoardList_MacQuestion();
	public List<BoardVO> bdao_getBoardList_AddonQuestion();
	
	public int bdao_getNextNum();
	
	public void bdao_writeBoard_MacReview(BoardVO boardVo);
	public void bdao_writeBoard_AddonReview(BoardVO boardVo);
	public void bdao_writeBoard_MacQuestion(BoardVO boardVo);
	public void bdao_writeBoard_AddonQuestion(BoardVO boardVo);

}
