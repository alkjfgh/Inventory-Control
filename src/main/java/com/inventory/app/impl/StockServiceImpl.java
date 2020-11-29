package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.StockVO;
import com.inventory.app.service.StockService;

@Service("StockService")
public class StockServiceImpl implements StockService {
	@Autowired
	private StockDAO dao;

	@Override
	public int insert(StockVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(StockVO vo) {
		return dao.delete(vo);
	}
	
	@Override
	public int deleteShop(StockVO vo) {
		return dao.deleteShop(vo);
	}

	@Override
	public int update(StockVO vo) {
		return dao.update(vo);
	}

	@Override
	public StockVO select(StockVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<StockVO> selectList(StockVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}

	@Override
	public int selectCnt() {
		return dao.selectCnt();
	}
}
