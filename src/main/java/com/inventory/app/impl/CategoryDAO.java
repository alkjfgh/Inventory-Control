package com.inventory.app.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.app.domain.CategoryVO;

@Repository("CategoryDAO")
public class CategoryDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public int insert(CategoryVO vo) {
		return sessionTemplate.insert("categoryMapper.insert", vo);
	}

	public int delete(CategoryVO vo) {
		return sessionTemplate.delete("categoryMapper.delete", vo);
	}

	public int update(CategoryVO vo) {
		return sessionTemplate.update("categoryMapper.update", vo);
	}

	public CategoryVO select(CategoryVO vo) {
		return sessionTemplate.selectOne("categoryMapper.select", vo);
	}

	public List<CategoryVO> selectList(CategoryVO vo) {
		return sessionTemplate.selectList("categoryMapper.selectList", vo);
	}

	public int deleteAll() {
		return sessionTemplate.delete("categoryMapper.deleteAll");
	}

	public int selectCnt() {
		return sessionTemplate.selectOne("categoryMapper.selectCnt");
	}
}
