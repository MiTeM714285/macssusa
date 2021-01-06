package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAOImpl boardDao;
	
	@Override
	public List<BoardVO> getBoardList_MacReview(){
		// TODO Auto-generated method stub
		return boardDao.bdao_getBoardList_MacReview();
	}
	@Override
	public List<BoardVO> getBoardList_AddonReview(){
		// TODO Auto-generated method stub
		return boardDao.bdao_getBoardList_AddonReview();
	}
	@Override
	public List<BoardVO> getBoardList_MacQuestion(){
		// TODO Auto-generated method stub
		return boardDao.bdao_getBoardList_MacQuestion();
	}
	@Override
	public List<BoardVO> getBoardList_AddonQuestion(){
		// TODO Auto-generated method stub
		return boardDao.bdao_getBoardList_AddonQuestion();
	}
	
	@Override
	public int getNextNum() {
		// TODO Auto-generated method stub
		return boardDao.bdao_getNextNum();
	}
	
	@Override
	public void writeBoard_MacReview(BoardVO boardVo) {
		// TODO Auto-generated method stub
		boardDao.bdao_writeBoard_MacReview(boardVo);
	}
	@Override
	public void writeBoard_AddonReview(BoardVO boardVo) {
		// TODO Auto-generated method stub
		boardDao.bdao_writeBoard_AddonReview(boardVo);
	}
	@Override
	public void writeBoard_MacQuestion(BoardVO boardVo) {
		// TODO Auto-generated method stub
		boardDao.bdao_writeBoard_MacQuestion(boardVo);
	}
	@Override
	public void writeBoard_AddonQuestion(BoardVO boardVo) {
		// TODO Auto-generated method stub
		boardDao.bdao_writeBoard_AddonQuestion(boardVo);
	}
	
	

	

}
