package com.macssusa.model;

import java.util.List;

public interface BoardDAO {
	
	public List<BoardVO> bdao_getBoardList_MacReview();
	public List<BoardVO> bdao_getBoardList_AddonReview();
	public List<BoardVO> bdao_getBoardList_MacQuestion();
	public List<BoardVO> bdao_getBoardList_AddonQuestion();

}
