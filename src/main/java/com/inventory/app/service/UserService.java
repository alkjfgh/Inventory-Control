package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.UserVO;

public interface UserService {
	public int insert(UserVO vo);

	public int delete(UserVO vo);
	
	public int update(UserVO vo);
	
	public UserVO select(UserVO vo);
	
	public List<UserVO> selectList(UserVO vo);
	
	public int deleteAll();
	
	public int selectCnt();
}
