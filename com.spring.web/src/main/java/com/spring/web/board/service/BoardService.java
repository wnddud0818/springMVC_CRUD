package com.spring.web.board.service;

import java.util.List;
import java.util.Map;

import com.spring.web.board.model.BoardVO;

public interface BoardService {
	//글조회
	public List<BoardVO> getBoardList() throws Exception;
	//글쓰기
	public <String, Object> void insertBoard(BoardVO boardVO) throws Exception;

}
