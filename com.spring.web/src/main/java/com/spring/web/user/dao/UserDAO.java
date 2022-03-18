package com.spring.web.user.dao; 
import java.util.List;

import com.spring.web.common.Pagination;
import com.spring.web.common.Search;
import com.spring.web.user.model.UserVO; 
public interface UserDAO { 
	public List<UserVO> getUserList(Search search) throws Exception; 
	public UserVO getUserInfo(String uid) throws Exception; 
	public int insertUser(UserVO userVO) throws Exception; 
	public int updateUser(UserVO userVO) throws Exception; 
	public int deleteUser(String uid) throws Exception; 
	public int getUserListCnt(Search search) throws Exception;
}