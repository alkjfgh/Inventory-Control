package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.ItemMovementVO;

public interface ItemMovementService {
	public int insert(ItemMovementVO vo);

	public int delete(ItemMovementVO vo);
	
	public int update(ItemMovementVO vo);
	
	public ItemMovementVO select(ItemMovementVO vo);
	
	public List<ItemMovementVO> selectList(ItemMovementVO vo);
	
	public List<ItemMovementVO> selectView(ItemMovementVO vo);

	public int deleteAll();
	
	public int selectCnt();
}
