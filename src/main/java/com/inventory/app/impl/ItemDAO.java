package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.ItemVO;

@Repository("ItemDAO")
public class ItemDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(ItemVO vo) {
		return sessionTemplate.insert("itemMapper.insert", vo);
	}

	public int delete(ItemVO vo) {
		return sessionTemplate.delete("itemMapper.delete", vo);
	}

	public int update(ItemVO vo) {
		return sessionTemplate.update("itemMapper.update", vo);
	}

	public ItemVO select(ItemVO vo) {
		return sessionTemplate.selectOne("itemMapper.select", vo);
	}

	public List<ItemVO> selectList(ItemVO vo) {
		return sessionTemplate.selectList("itemMapper.selectList", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("itemMapper.deleteAll");
	}
	
	public int selectCnt() {
		return sessionTemplate.selectOne("itemMapper.selectCnt");
	}
}
