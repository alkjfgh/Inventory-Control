 package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.SoldLogVO;
import com.inventory.app.service.SoldLogService;

@Service("SoldLogService")
public class SoldLogServiceImpl implements SoldLogService {

	@Autowired
	private SoldLogDAO dao;
	
	@Override
	public int insert(SoldLogVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(SoldLogVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(SoldLogVO vo) {
		return dao.update(vo);
	}

	@Override
	public SoldLogVO select(SoldLogVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<SoldLogVO> selectList(SoldLogVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public long selectWeek(SoldLogVO vo) {
		if(dao.selectMaxCount() < 7) return -1;
		return dao.selectWeek(vo);
	}

	@Override
	public long selectMonth(SoldLogVO vo) {
		if(dao.selectMaxCount() < 30) return -1;
		return dao.selectMonth(vo);
	}

	@Override
	public long selectPeriod(SoldLogVO vo) {
		return dao.selectPeriod(vo);
	}

	@Override
	public long selectMaxCount() {
		return dao.selectMaxCount();
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
