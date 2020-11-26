package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.ShopVO;
import com.inventory.app.service.ShopService;

@Service("ShopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO dao;
	
	@Override
	public int insert(ShopVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(ShopVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(ShopVO vo) {
		return dao.update(vo);
	}

	@Override
	public ShopVO select(ShopVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<ShopVO> selectList(ShopVO vo) {
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
