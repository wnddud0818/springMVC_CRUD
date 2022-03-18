package com.spring.web.user.service; 

import java.util.List; 
import javax.inject.Inject; 
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.stereotype.Service;

import com.spring.web.common.Pagination;
import com.spring.web.common.Search;
import com.spring.web.user.dao.UserDAO; 
import com.spring.web.user.model.UserVO; 
@Service public class UserServiceImpl implements UserService{
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class); 
	@Inject private UserDAO userDAO; 
	@Override public List<UserVO> getUserList(Search search) throws Exception { 
		return userDAO.getUserList(search); 
		} 
	@Override public UserVO getUserInfo(String uid) throws Exception { 
		return userDAO.getUserInfo(uid); 
		}
	@Override public void insertUser(UserVO userVO) throws Exception { 
		userDAO.insertUser(userVO); 
		} 
	@Override public void updateUser(UserVO userVO) throws Exception { 
		userDAO.updateUser(userVO); 
		} 
	@Override public void deleteUser(String uid) throws Exception { 
		userDAO.deleteUser(uid); 
		} 
	@Override public int getUserListCnt(Search search) throws Exception {
		return userDAO.getUserListCnt(search);
	}
	}
	

