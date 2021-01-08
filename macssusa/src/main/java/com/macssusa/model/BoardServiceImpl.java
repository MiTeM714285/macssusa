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
	public List<BoardVO> getBoardListPageSearch(int btype, int displayPost, int postNum, String searchType,
			String keyword) {
		return mapper.getBoardListPageSearch(btype, displayPost, postNum, searchType, keyword);
	}
	
	@Override
	public int getBoardCount(int btype) {
		// TODO Auto-generated method stub
		return mapper.getBoardCount(btype);
	}
	@Override
	public int getBoardCountSearch(int btype, String searchType, String keyword) {
		// TODO Auto-generated method stub
		return mapper.getBoardCountSearch(btype, searchType, keyword);
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
	@Override
	public void hitcountUp(int bnum) {
		mapper.hitcountUp(bnum);
	}
	@Override
	public void replyCountUp(int bnum) {
		mapper.replyCountUp(bnum);
	}
	@Override
	public void replyCountDown(int bnum) {
		mapper.replyCountDown(bnum);
	}
}
