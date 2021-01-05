package com.macssusa.model;

import java.util.List;

public interface BoardService {
	
	public List<BoardVO> getBoardList_MacReview();
	public List<BoardVO> getBoardList_AddonReview();
	public List<BoardVO> getBoardList_MacQuestion();
	public List<BoardVO> getBoardList_AddonQuestion();

}
