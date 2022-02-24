package com.spring.web.board.dao;

import java.util.List;

import com.spring.web.board.model.BoardVO;
import com.spring.web.common.Pagination;
import com.spring.web.common.Search;

public interface BoardDAO {

	public List<BoardVO> getBoardList(Search search) throws Exception;
	
	public BoardVO getBoardContent(int bid) throws Exception;
	
	public int insertBoard(BoardVO boardVO) throws Exception;
	
	public int updateBoard(BoardVO boardVO) throws Exception;
	
	public int deleteBoard(int bid) throws Exception;
	
	public int updateViewCnt(int bid) throws Exception;
	//페이징함수
	public int getBoardListCnt(Search search) throws Exception;
}