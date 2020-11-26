package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.ShopVO;

@Repository("ShopDAO")
public class ShopDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(ShopVO vo) {
		return sessionTemplate.insert("shopMapper.insert", vo);
	}

	public int delete(ShopVO vo) {
		return sessionTemplate.delete("shopMapper.delete", vo);
	}

	public int update(ShopVO vo) {
		return sessionTemplate.update("shopMapper.update", vo);
	}

	public ShopVO select(ShopVO vo) {
		return sessionTemplate.selectOne("shopMapper.select", vo);
	}

	public List<ShopVO> selectList(ShopVO vo) {
		return sessionTemplate.selectList("shopMapper.selectList", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("shopMapper.deleteAll");
	}
	
	public int selectCnt() {
		return sessionTemplate.selectOne("shopMapper.selectCnt");
	}
}
