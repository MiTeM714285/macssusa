package com.macssusa.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.macssusa.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public List<CommentVO> getCommentList(int bnum) throws Exception {
		return commentMapper.getCommentList(bnum);
	}

	@Override
	public void writeComment(CommentVO commentVo) throws Exception {
		commentMapper.writeComment(commentVo);
	}
	
	@Override
	public CommentVO getCommentByCnum(int cnum) throws Exception {
		commentMapper.getCommentByCnum(cnum);
		return null;
	}

	@Override
	public void updateComment(CommentVO commentVo) throws Exception {
		commentMapper.updateComment(commentVo);
	}

	@Override
	public void deleteComment(int cnum) throws Exception {
		commentMapper.deleteComment(cnum);
	}

	@Override
	public int getNextNum() {
		// TODO Auto-generated method stub
		return commentMapper.getNextNum();
	}

	@Override
	public int getCommentCount(int bnum) throws Exception {
		// TODO Auto-generated method stub
		return commentMapper.getCommentCount(bnum);
	}

	@Override
	public void completelyDeleteByCnum(int cnum) {
		// TODO Auto-generated method stub
		commentMapper.completelyDeleteByCnum(cnum);
	}

	@Override
	public List<CommentVO> getDeletedCommentList() {
		return commentMapper.getDeletedCommentList();
	}


	
	

}
