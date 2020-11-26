package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.ItemVO;

public interface ItemService {
	public int insert(ItemVO vo);

	public int delete(ItemVO vo);
	
	public int update(ItemVO vo);
	
	public ItemVO select(ItemVO vo);
	
	public List<ItemVO> selectList(ItemVO vo);

	public int deleteAll();
	
	public int selectCnt();
}
