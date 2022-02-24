package com.spring.web.board.service;

import java.util.List;
import java.util.Map;

import com.spring.web.board.model.BoardVO;
import com.spring.web.common.Pagination;
import com.spring.web.common.Search;

public interface BoardService {
	//글조회
	public List<BoardVO> getBoardList(Search search) throws Exception;
	//글쓰기
	public <String, Object> void insertBoard(BoardVO boardVO) throws Exception;
	//상세조회
	public BoardVO getBoardContent(int bid) throws Exception;
	//수정 
	public <String, Object> void updateBoard(BoardVO boardVO) throws Exception;
	//삭제 
	public void deleteBoard(int bid) throws Exception;
	//페이징
	public int getBoardListCnt(Search search) throws Exception;
}
