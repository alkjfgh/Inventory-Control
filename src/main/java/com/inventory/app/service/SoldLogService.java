package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.SoldLogVO;

public interface SoldLogService {
	public int insert(SoldLogVO vo);

	public int delete(SoldLogVO vo);
	
	public int update(SoldLogVO vo);
	
	public SoldLogVO select(SoldLogVO vo);
	
	public List<SoldLogVO> selectList(SoldLogVO vo);
	
	public long selectWeek(SoldLogVO vo);
	
	public long selectMonth(SoldLogVO vo);
	
	public long selectPeriod(SoldLogVO vo);
	
	public long selectMaxCount();

	public int deleteAll();
	
	public int selectCnt();
}
