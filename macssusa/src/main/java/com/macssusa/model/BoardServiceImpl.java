package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macssusa.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getBoardList_MacReview(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_MacReview();
	}
	@Override
	public List<BoardVO> getBoardList_AddonReview(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_AddonReview();
	}
	@Override
	public List<BoardVO> getBoardList_MacQuestion(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_MacQuestion();
	}
	@Override
	public List<BoardVO> getBoardList_AddonQuestion(){
		// TODO Auto-generated method stub
		return mapper.getBoardList_AddonQuestion();
	}
	
	@Override
	public int getNextNum() {
		// TODO Auto-generated method stub
		return mapper.getNextNum();
	}
	
	@Override
	public void writeBoard_MacReview(BoardVO boardVo) {
		// TODO Auto-generated method stub
		mapper.writeBoard_MacReview(boardVo);
	}
	@Override
	public void writeBoard_AddonReview(BoardVO boardVo) {
		// TODO Auto-generated method stub
		mapper.writeBoard_AddonReview(boardVo);
	}
	@Override
	public void writeBoard_MacQuestion(BoardVO boardVo) {
		// TODO Auto-generated method stub
		mapper.writeBoard_MacQuestion(boardVo);
	}
	@Override
	public void writeBoard_AddonQuestion(BoardVO boardVo) {
		// TODO Auto-generated method stub
		mapper.writeBoard_AddonQuestion(boardVo);
	}
	
	
	@Override
	public BoardVO getBoardView(int bnum, int btype) {
		// TODO Auto-generated method stub
		return mapper.getBoardView(bnum, btype);
	}
	@Override
	public void updateBoard(BoardVO boardVo) {
		mapper.updateBoard(boardVo);
		
	}
	@Override
	public void deleteBoard(int bnum) {
		// TODO Auto-generated method stub
		mapper.deleteBoard(bnum);
	}
	
	


}
