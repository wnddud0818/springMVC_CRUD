package com.spring.web.board.controller;

import javax.inject.Inject;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.web.board.model.BoardVO;
import com.spring.web.board.service.BoardService;

@Controller
@RequestMapping(value = "/board")
public class BoardController {

	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public String getBoardList(Model model) throws Exception {
		model.addAttribute("boardList", boardService.getBoardList());
		return "board/index";
	}
	//글쓰기
	@RequestMapping("/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("BoardVO") BoardVO boardVO 
			, RedirectAttributes rttr) throws Exception {
		boardService.insertBoard(boardVO);
		return "redirect:/board/getBoardList";
	}

}	
