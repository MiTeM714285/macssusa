package com.macssusa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.macssusa.model.BoardVO;

public interface BoardMapper {
	
	// 값이 2개이상일때는 @Param("변수명")사용

	// 게시글리스트(기초)
	public List<BoardVO> getBoardList(int btype);
	// 게시글리스트(최신글 5개)
	public List<BoardVO> getRecentBoardList(int btype);
	// 게시글리스트(페이징 추가)
	public List<BoardVO> getBoardListPage(@Param("btype")int btype, @Param("displayPost")int displayPost, @Param("postNum")int postNum); 
	// 게시글리스트(페이징 추가)
	public List<BoardVO> getBoardListPageSearch(@Param("btype")int btype, @Param("displayPost")int displayPost, @Param("postNum")int postNum, @Param("searchType")String searchType, @Param("keyword")String keyword); 
	
	public int getBoardCount(int btype);
	public int getBoardCountSearch(@Param("btype")int btype, @Param("searchType")String searchType, @Param("keyword")String keyword);
	
	public int getNextNum();

	public void writeBoard(BoardVO boardVo);
	
	public BoardVO getBoardView(@Param("bnum")int bnum, @Param("btype")int btype);
	
	public void updateBoard(BoardVO boardVo);
	
	public void deleteBoard(int bnum);
	
	// 조회수1증가
	public void hitcountUp(int bnum);
	
	// 댓글수 조작
	public void replyCountUp(int bnum);
	public void replyCountDown(int bnum);
	
	public List<BoardVO> getDeletedBoardList();
	public void completelyDeleteByBnum(int bnum);
	
}
