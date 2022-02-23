package com.spring.web.board.service;

import java.util.List;
import java.util.Map;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.web.board.dao.BoardDAO;
import com.spring.web.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO boardDAO;
	
	public List<BoardVO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}
}