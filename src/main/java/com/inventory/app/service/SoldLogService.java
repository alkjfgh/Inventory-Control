package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemVO;
import com.inventory.app.domain.SoldLogVO;

public interface SoldLogService {
	public int insert(SoldLogVO vo);

	public int delete(SoldLogVO vo);

	public int update(SoldLogVO vo);

	public SoldLogVO select(SoldLogVO vo);

	public List<SoldLogVO> selectList(SoldLogVO vo);

	public List<SoldLogVO> selectWeek(SoldLogVO vo);

	public List<SoldLogVO> selectMonth(SoldLogVO vo);

	public List<SoldLogVO> selectPeriod(SoldLogVO vo);

	public long selectMaxCount();

	public List<CategoryVO> selectCategoryList(SoldLogVO vo);

	public List<CategoryVO> selectCategoryWeek(SoldLogVO vo);

	public List<CategoryVO> selectCategoryMonth(SoldLogVO vo);

	public List<CategoryVO> selectCategoryPeriod(SoldLogVO vo);

	public List<ItemVO> selectItemList(SoldLogVO vo);

	public List<ItemVO> selectItemWeek(SoldLogVO vo);

	public List<ItemVO> selectItemMonth(SoldLogVO vo);

	public List<ItemVO> selectItemPeriod(SoldLogVO vo);

	public int deleteAll();

	public int selectCnt();
}
