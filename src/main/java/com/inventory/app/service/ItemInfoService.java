package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.ItemInfoVO;

public interface ItemInfoService {
	public List<ItemInfoVO> selectList(long shopSeq, long categorySeq);
	
	public int categoryCount(long shopSeq, long categorySeq);
}
