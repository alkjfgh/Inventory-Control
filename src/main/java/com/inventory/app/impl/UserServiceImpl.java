package com.inventory.app.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.UserVO;
import com.inventory.app.security.SecurityUse;
import com.inventory.app.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Autowired
	private SecurityUse security;

	@Override
	public int insert(UserVO vo) throws UnsupportedEncodingException {
		UserVO user = new UserVO(security.security(vo.getUserId()).toString(), vo.getUserEmail(), vo.getUserPhone(),
				security.security(vo.getUserPassword()).toString(), vo.getShopSeq(), vo.getUserName(),
				vo.getUserAddress(), vo.getUserLevel());
		return dao.insert(user);
	}

	@Override
	public int delete(UserVO vo) {
		vo = findUser(vo);
		return dao.delete(vo);
	}

	@Override
	public int update(UserVO vo) {
		vo = findUser(vo);
		return dao.update(vo);
	}

	@Override
	public UserVO select(UserVO vo) {
		vo = findUser(vo);
		if (vo != null) {
			vo.setUserId(security.recorvery(vo.getUserId()));
			vo.setUserPassword(security.recorvery(vo.getUserPassword()));
		}
		return vo;
	}

	@Override
	public List<UserVO> selectList(UserVO vo) {
		List<UserVO> userList = dao.selectList(vo);
		for (UserVO user : userList) {
			user.setUserId(security.recorvery(user.getUserId()));
			user.setUserPassword(security.recorvery(user.getUserPassword()));
		}
		return userList;
	}

	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}

	@Override
	public int selectCnt() {
		return dao.selectCnt();
	}

	private UserVO findUser(UserVO vo) {
		List<UserVO> userList = dao.selectList(null);
		for (UserVO user : userList) {
			if (security.recorvery(user.getUserId()).equals(vo.getUserId())) {
				return user;
			}
		}
		return null;
	}

}
