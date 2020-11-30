package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemInfoVO;

public interface ItemInfoService {
	public List<ItemInfoVO> selectList(CategoryVO vo);
	
	public int categoryCount(CategoryVO vo);
}
