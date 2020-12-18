package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.ItemInfoVO;

@Repository("ItemInfoDAO")
public class ItemInfoDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<ItemInfoVO> selectList(ItemInfoVO vo) {
		return sessionTemplate.selectList("itemInfoMapper.selectList", vo);
	}

	public int selectCount(ItemInfoVO vo) {
		return sessionTemplate.selectOne("itemInfoMapper.selectCount", vo);
	}

	public List<ItemInfoVO> selectBuyList(ItemInfoVO vo) {
		return sessionTemplate.selectList("itemInfoMapper.selectBuyList", vo);
	}

}
