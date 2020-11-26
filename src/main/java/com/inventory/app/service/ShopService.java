package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.ShopVO;

public interface ShopService {
	public int insert(ShopVO vo);

	public int delete(ShopVO vo);
	
	public int update(ShopVO vo);
	
	public ShopVO select(ShopVO vo);
	
	public List<ShopVO> selectList(ShopVO vo);

	public int deleteAll();
	
	public int selectCnt();
}
