package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.StockVO;

public interface StockService {
	public int insert(StockVO vo);

	public int delete(StockVO vo);
	
	public int deleteShop(StockVO vo);
	
	public int update(StockVO vo);
	
	public StockVO select(StockVO vo);
	
	public List<StockVO> selectList(StockVO vo);

	public int deleteAll();
	
	public int selectCnt();
}
