package com.macssusa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 값이 2개이상일때는 @Param("변수명")사용
	public BoardVO getBoardView(@Param("bnum")int bnum, @Param("btype")int btype);
	
	public void updateBoard(BoardVO boardVo);
	
	public void deleteBoard(int bnum);
}
