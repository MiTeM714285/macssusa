package com.macssusa.model;

import java.util.List;

public interface BoardService {
	

	public List<BoardVO> getBoardList(int btype);
	public List<BoardVO> getBoardListPage(int btype, int displayPost, int postNum); // 게시글리스트(페이징 추가)
	
	public int getBoardCount(int btype);
	
	public int getNextNum();

	public void writeBoard(BoardVO boardVo);
	
	public BoardVO getBoardView(int bnum, int btype); 
	
	public void updateBoard(BoardVO boardVo);
	
	public void deleteBoard(int bnum);

}
