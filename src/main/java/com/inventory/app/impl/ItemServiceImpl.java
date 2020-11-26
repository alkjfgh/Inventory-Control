package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.ItemVO;
import com.inventory.app.service.ItemService;

@Service("ItemService")
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO dao;
	
	@Override
	public int insert(ItemVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(ItemVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(ItemVO vo) {
		return dao.update(vo);
	}

	@Override
	public ItemVO select(ItemVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<ItemVO> selectList(ItemVO vo) {
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
