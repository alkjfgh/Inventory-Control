package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.SoldLogVO;

@Repository("SoldLogDAO")
public class SoldLogDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public int insert(SoldLogVO vo) {
		return sessionTemplate.insert("soldLogMapper.insert", vo);
	}

	public int delete(SoldLogVO vo) {
		return sessionTemplate.delete("soldLogMapper.insert", vo);
	}

	public int update(SoldLogVO vo) {
		return sessionTemplate.update("soldLogMapper.update", vo);
	}

	public SoldLogVO select(SoldLogVO vo) {
		return sessionTemplate.selectOne("soldLogMapper.select", vo);
	}

	public List<SoldLogVO> selectList(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectList");
	}

	public long selectWeek(SoldLogVO vo) {
		return sessionTemplate.selectOne("soldLogMapper.selectWeek", vo);
	}

	public long selectMonth(SoldLogVO vo) {
		return sessionTemplate.selectOne("soldLogMapper.selectMonth", vo);
	}

	public long selectPeriod(SoldLogVO vo) {
		return sessionTemplate.selectOne("soldLogMapper.selectPeriod", vo);
	}

	public long selectMaxCount() {
		return sessionTemplate.selectOne("soldLogMapper.selectMaxCount");
	}

	public int deleteAll() {
		return sessionTemplate.delete("soldLogMapper.deleteAll");
	}

	public int selectCnt() {
		return sessionTemplate.selectOne("soldLogMapper.selectCnt");
	}
	
}
