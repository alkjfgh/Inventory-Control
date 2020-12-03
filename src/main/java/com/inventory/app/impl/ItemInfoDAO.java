package com.inventory.app.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.ItemInfoVO;

@Repository("ItemInfoDAO")
public class ItemInfoDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<ItemInfoVO> selectList(long shopSeq, long categorySeq) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("shopSeq", shopSeq);
		map.put("categorySeq", categorySeq);
		return sessionTemplate.selectList("itemInfoMapper.selectList", map);
	}

	public int categoryCount(long shopSeq, long categorySeq) {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("shopSeq", shopSeq);
		map.put("categorySeq", categorySeq);
		return sessionTemplate.selectOne("itemInfoMapper.categoryCount", map);
	}

}
