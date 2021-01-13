package com.macssusa.model;

import java.util.List;

public interface BoardService {
	

	public List<BoardVO> getBoardList(int btype);
	public List<BoardVO> getBoardListPage(int btype, int displayPost, int postNum); // 게시글리스트(페이징 추가)
	public List<BoardVO> getBoardListPageSearch(int btype, int displayPost, int postNum, String searchType, String keyword); // 게시글리스트(페이징+검색 추가)
	
	public int getBoardCount(int btype);
	public int getBoardCountSearch(int btype, String searchType, String keyword);
	
	public int getNextNum();

	public void writeBoard(BoardVO boardVo);
	
	public BoardVO getBoardView(int bnum, int btype); 
	
	public void updateBoard(BoardVO boardVo);
	
	public void deleteBoard(int bnum);
	
	public void hitcountUp(int bnum);
	
	// 댓글수 조작
	public void replyCountUp(int bnum);
	public void replyCountDown(int bnum);

	public List<BoardVO> getDeletedBoardList();
	public void completelyDeleteByBnum(int bnum);
}
