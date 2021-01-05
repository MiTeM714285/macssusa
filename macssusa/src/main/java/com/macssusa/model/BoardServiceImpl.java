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
		return boardDao.getBoardList_MacReview();
	}

	@Override
	public List<BoardVO> getBoardList_AddonReview(){
		// TODO Auto-generated method stub
		return boardDao.getBoardList_AddonReview();
	}

	@Override
	public List<BoardVO> getBoardList_MacQuestion(){
		// TODO Auto-generated method stub
		return boardDao.getBoardList_MacQuestion();
	}

	@Override
	public List<BoardVO> getBoardList_AddonQuestion(){
		// TODO Auto-generated method stub
		return boardDao.getBoardList_AddonQuestion();
	}

}
