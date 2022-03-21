package com.spring.web.user.service;

import java.util.List;

import com.spring.web.common.Pagination;
import com.spring.web.common.Search;
import com.spring.web.user.model.UserVO; 

public interface UserService { 
	
	public List<UserVO> getUserList(Search search) throws Exception; 
	
	public UserVO getUserContent(String uid) throws Exception;
	
	public UserVO getUserInfo(String uid) throws Exception; 
	
	public void insertUser(UserVO userVO) throws Exception; 
	
	public void updateUser(UserVO userVO) throws Exception; 
	
	public void deleteUser(String uid) throws Exception; 
	
	public int getUserListCnt(Search search) throws Exception;
}
