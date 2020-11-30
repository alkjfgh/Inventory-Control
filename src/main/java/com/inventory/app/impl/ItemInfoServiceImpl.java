package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;
import com.inventory.app.service.ItemInfoService;

@Service("ItemInfoService")
public class ItemInfoServiceImpl implements ItemInfoService {
	
	@Autowired
	private ItemInfoDAO dao;

	@Override
	public List<ItemInfoVO> selectList(ItemInfoVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public int categoryCount(CategoryVO vo) {
		return dao.categoryCount(vo);
	}

}
