package com.spring.web.board.dao;

import java.util.List;

import com.spring.web.board.model.BoardVO;
import com.spring.web.common.Pagination;

public interface BoardDAO {

	public List<BoardVO> getBoardList(Pagination pagination) throws Exception;
	
	public BoardVO getBoardContent(int bid) throws Exception;
	
	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public int updateBoard(BoardVO boardVO) throws Exception;
	
	public int deleteBoard(int bid) throws Exception;
	
	public int updateViewCnt(int bid) throws Exception;
	//페이징함수
	public int getBoardListCnt() throws Exception;
}