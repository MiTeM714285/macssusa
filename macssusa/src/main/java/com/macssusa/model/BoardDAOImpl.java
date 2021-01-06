package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.macssusa.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private BoardMapper mapper;
	//private static String namespace = "com.macssusa.mapper.BoardMapper";

	@Override
	public List<BoardVO> bdao_getBoardList_MacReview(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_MacReview();
	}
	@Override
	public List<BoardVO> bdao_getBoardList_AddonReview(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_AddonReview();
	}
	@Override
	public List<BoardVO> bdao_getBoardList_MacQuestion(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_MacQuestion();
	}
	@Override
	public List<BoardVO> bdao_getBoardList_AddonQuestion(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_AddonQuestion();
	}
	
	@Override
	public int bdao_getNextNum() {
		// TODO Auto-generated method stub
		return mapper.getNextNum();
	}
	
	@Override
	public void bdao_writeBoard_MacReview(BoardVO boardVo) {
		mapper.writeBoard_MacReview(boardVo);
	}
	@Override
	public void bdao_writeBoard_AddonReview(BoardVO boardVo) {
		mapper.writeBoard_AddonReview(boardVo);
	}
	@Override
	public void bdao_writeBoard_MacQuestion(BoardVO boardVo) {
		mapper.writeBoard_MacQuestion(boardVo);
	}
	@Override
	public void bdao_writeBoard_AddonQuestion(BoardVO boardVo) {
		mapper.writeBoard_AddonQuestion(boardVo);
	}

	

}
