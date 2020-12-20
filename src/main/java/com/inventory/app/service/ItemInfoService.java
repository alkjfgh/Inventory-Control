package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.ItemInfoVO;

public interface ItemInfoService {
	public List<ItemInfoVO> selectList(ItemInfoVO vo);
	
	public int selectCount(ItemInfoVO vo);

	public List<ItemInfoVO> selectBuyList(ItemInfoVO vo);

	public int selectBuyCount(ItemInfoVO vo);

	public List<ItemInfoVO> shopItemList(ItemInfoVO vo);
}
