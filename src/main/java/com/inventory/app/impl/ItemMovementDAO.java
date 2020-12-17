package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.ItemMovementVO;

@Repository("ItemMovementDAO")
public class ItemMovementDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(ItemMovementVO vo) {
		return sessionTemplate.insert("itemMovementMapper.insert", vo);
	}

	public int delete(ItemMovementVO vo) {
		return sessionTemplate.delete("itemMovementMapper.delete", vo);
	}

	public int update(ItemMovementVO vo) {
		return sessionTemplate.update("itemMovementMapper.update", vo);
	}

	public ItemMovementVO select(ItemMovementVO vo) {
		return sessionTemplate.selectOne("itemMovementMapper.selectOne", vo);
	}

	public List<ItemMovementVO> selectList(ItemMovementVO vo) {
		return sessionTemplate.selectList("itemMovementMapper.selectList", vo);
	}

	public List<ItemMovementVO> selectView(ItemMovementVO vo) {
		return sessionTemplate.selectList("itemMovementMapper.selectView", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("itemMovementMapper.delete");
	}

	public int selectCnt() {
		return sessionTemplate.selectOne("itemMovementMapper.selectOne");
	}

}
