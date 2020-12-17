package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.ItemMovementVO;
import com.inventory.app.service.ItemMovementService;

@Service("ItemMovementService")
public class ItemMovementServiceImpl implements ItemMovementService{

	@Autowired
	private ItemMovementDAO dao;

	@Override
	public int insert(ItemMovementVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(ItemMovementVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(ItemMovementVO vo) {
		return dao.update(vo);
	}

	@Override
	public ItemMovementVO select(ItemMovementVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<ItemMovementVO> selectList(ItemMovementVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public List<ItemMovementVO> selectView(ItemMovementVO vo) {
		return dao.selectView(vo);
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
