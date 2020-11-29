package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.StockVO;

@Repository("StockDAO")
public class StockDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(StockVO vo) {
		return sessionTemplate.insert("stockMapper.insert", vo);
	}

	public int delete(StockVO vo) {
		return sessionTemplate.delete("stockMapper.delete", vo);
	}

	public int deleteShop(StockVO vo) {
		return sessionTemplate.delete("stockMapper.deleteShop", vo);
	}

	public int update(StockVO vo) {
		return sessionTemplate.update("stockMapper.update", vo);
	}

	public StockVO select(StockVO vo) {
		return sessionTemplate.selectOne("stockMapper.select", vo);
	}

	public List<StockVO> selectList(StockVO vo) {
		return sessionTemplate.selectList("stockMapper.selectList", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("stockMapper.deleteAll");
	}

	public int selectCnt() {
		return sessionTemplate.selectOne("stockMapper.selectCnt");
	}
}
