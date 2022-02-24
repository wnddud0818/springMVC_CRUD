package com.spring.web.board.service;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.web.board.dao.BoardDAO;
import com.spring.web.board.model.BoardVO;
import com.spring.web.common.Pagination;
import com.spring.web.common.Search;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO boardDAO;
	
	public List<BoardVO> getBoardList(Search search) throws Exception {
		return boardDAO.getBoardList(search);
	}
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}
	public BoardVO getBoardContent(int bid) throws Exception{
		boardDAO.updateViewCnt(bid);
		return boardDAO.getBoardContent(bid);
	}
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
	}
	@Override
	public void deleteBoard(int bid) throws Exception {
		 boardDAO.deleteBoard(bid);
	}
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}
}