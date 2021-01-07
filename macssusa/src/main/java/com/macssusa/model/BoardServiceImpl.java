package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macssusa.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;

	public List<BoardVO> getBoardList(int btype){
		// TODO Auto-generated method stub
		return mapper.getBoardList(btype);
	}
	@Override
	public List<BoardVO> getBoardListPage(int btype, int displayPost, int postNum) {
		return mapper.getBoardListPage(btype, displayPost, postNum);
	}
	@Override
	public int getBoardCount(int btype) {
		// TODO Auto-generated method stub
		return mapper.getBoardCount(btype);
	}
	@Override
	public int getNextNum() {
		// TODO Auto-generated method stub
		return mapper.getNextNum();
	}
	@Override
	public void writeBoard(BoardVO boardVo) {
		// TODO Auto-generated method stub
		mapper.writeBoard(boardVo);
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
