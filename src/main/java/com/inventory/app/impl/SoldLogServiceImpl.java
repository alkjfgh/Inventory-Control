package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemVO;
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
	public List<SoldLogVO> selectWeek(SoldLogVO vo) {
		if (dao.selectMaxCount() < 7)
			return null;
		return dao.selectWeek(vo);
	}

	@Override
	public List<SoldLogVO> selectMonth(SoldLogVO vo) {
		if (dao.selectMaxCount() < 30)
			return null;
		return dao.selectMonth(vo);
	}

	@Override
	public List<SoldLogVO> selectPeriod(SoldLogVO vo) {
		return dao.selectPeriod(vo);
	}

	@Override
	public List<CategoryVO> selectCategoryList(SoldLogVO vo) {
		return dao.selectCategoryList(vo);
	}

	@Override
	public List<CategoryVO> selectCategoryWeek(SoldLogVO vo) {
		return dao.selectCategoryWeek(vo);
	}

	@Override
	public List<CategoryVO> selectCategoryMonth(SoldLogVO vo) {
		return dao.selectCategoryMonth(vo);
	}

	@Override
	public List<CategoryVO> selectCategoryPeriod(SoldLogVO vo) {
		return dao.selectCategoryPeriod(vo);
	}

	@Override
	public List<ItemVO> selectItemList(SoldLogVO vo) {
		return dao.selectItemList(vo);
	}

	@Override
	public List<ItemVO> selectItemWeek(SoldLogVO vo) {
		return dao.selectItemWeek(vo);
	}

	@Override
	public List<ItemVO> selectItemMonth(SoldLogVO vo) {
		return dao.selectItemMonth(vo);
	}

	@Override
	public List<ItemVO> selectItemPeriod(SoldLogVO vo) {
		return dao.selectItemPeriod(vo);
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
