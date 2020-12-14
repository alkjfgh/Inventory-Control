package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.domain.ItemVO;
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

	public List<SoldLogVO> selectWeek(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectWeek", vo);
	}

	public List<SoldLogVO> selectMonth(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectMonth", vo);
	}

	public List<SoldLogVO> selectPeriod(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectPeriod", vo);
	}

	public List<CategoryVO> selectCategoryList(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectCategoryList", vo);
	}

	public List<CategoryVO> selectCategoryWeek(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectCategoryWeek", vo);
	}

	public List<CategoryVO> selectCategoryMonth(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectCategoryMonth", vo);
	}

	public List<CategoryVO> selectCategoryPeriod(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectCategoryPeriod", vo);
	}

	public List<ItemVO> selectItemList(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectItemList", vo);
	}

	public List<ItemVO> selectItemWeek(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectItemWeek", vo);
	}

	public List<ItemVO> selectItemMonth(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectItemMonth", vo);
	}

	public List<ItemVO> selectItemPeriod(SoldLogVO vo) {
		return sessionTemplate.selectList("soldLogMapper.selectItemPeriod", vo);
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
