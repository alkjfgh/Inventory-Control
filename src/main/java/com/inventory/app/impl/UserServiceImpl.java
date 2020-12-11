package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.UserVO;
import com.inventory.app.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;
	
//	@Autowired
//	private SecurityUse security;
	
	@Override
	public int insert(UserVO vo) {
		/*
		 * vo.setUserId(security.security(vo.getUserId()));
		 * vo.setUserPassword(security.security(vo.getUserPassword()));
		 */
		return dao.insert(vo);
	}

	@Override
	public int delete(UserVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(UserVO vo) {
		return dao.update(vo);
	}

	@Override
	public UserVO select(UserVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<UserVO> selectList(UserVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}

	@Override
	public int selectCnt() {
		return dao.selectCnt();
	}

}
