package com.spring.web.user.controller;

import javax.inject.Inject; 
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.ModelAttribute; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.spring.web.common.Pagination;
import com.spring.web.common.Search;
import com.spring.web.user.model.UserVO; 
import com.spring.web.user.service.UserService; 
@Controller @RequestMapping(value = "/user") public class UserController { 
	private static final Logger logger = LoggerFactory.getLogger(UserController.class); 
	
	@Inject private UserService userService; 
	
	@RequestMapping(value = "/getUserList", method = RequestMethod.GET) 
	
	public String getUserList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "title") String searchType
			, @RequestParam(required = false) String keyword
			) throws Exception{ 
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		//전체 회원 수
		int listCnt = userService.getUserListCnt(search);
		search.pageInfo(page, range, listCnt);
		//Pagination 객체생성
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		logger.info("getUserList()...."); 
		model.addAttribute("userList", userService.getUserList(search)); 
		return "user/userList"; 
		}
	@RequestMapping(value = "/getUserContent", method = RequestMethod.GET)
	public String getUserContent(Model model, @RequestParam("uid") String uid) throws Exception {
		model.addAttribute("userContent", userService.getUserContent(uid));
		return "user/userContent";
	}
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST) 
	
	public String insertUser(@ModelAttribute("userVO") UserVO userVO , RedirectAttributes rttr) throws Exception {
		userService.insertUser(userVO); return "redirect:/user/getUserList"; 
		} 
	@RequestMapping(value = "/signupForm", method = RequestMethod.GET) public String signupForm(Model model) throws Exception { model.addAttribute("userVO", new UserVO()); return "user/signupForm"; }
	}
