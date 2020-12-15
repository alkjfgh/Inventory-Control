package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.UserVO;

@Repository("UserDAO")
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(UserVO vo){
		return sessionTemplate.insert("UserMapper.insert", vo);
	}

	public int delete(UserVO vo) {
		return sessionTemplate.delete("UserMapper.delete", vo);
	}

	public int update(UserVO vo) {
		return sessionTemplate.update("UserMapper.update", vo);
	}

	public UserVO select(UserVO vo) {
		return sessionTemplate.selectOne("UserMapper.select", vo);
	}

	public List<UserVO> selectList(UserVO vo) {
		return sessionTemplate.selectList("UserMapper.selectList", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("UserMapper.deleteAll");
	}

	public int selectCnt() {
		return sessionTemplate.selectOne("UserMapper.selectCnt");
	}
}
