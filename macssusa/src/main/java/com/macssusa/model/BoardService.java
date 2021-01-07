package com.macssusa.model;

import java.util.List;

public interface BoardService {
	
	public List<BoardVO> getBoardList_MacReview();
	public List<BoardVO> getBoardList_AddonReview();
	public List<BoardVO> getBoardList_MacQuestion();
	public List<BoardVO> getBoardList_AddonQuestion();
	
	public int getNextNum();
	
	public void writeBoard_MacReview(BoardVO boardVo);
	public void writeBoard_AddonReview(BoardVO boardVo);
	public void writeBoard_MacQuestion(BoardVO boardVo);
	public void writeBoard_AddonQuestion(BoardVO boardVo);
	
	public BoardVO getBoardView(int bnum, int btype); 
	
	public void updateBoard(BoardVO boardVo);
	
	public void deleteBoard(int bnum);

}
