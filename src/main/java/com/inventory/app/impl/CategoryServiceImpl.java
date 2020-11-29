package com.inventory.app.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.service.CategoryService;

@Service("CategoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDAO dao;
	@Override
	public int insert(CategoryVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(CategoryVO vo) {
		return dao.delete(vo);
	}

	@Override
	public int update(CategoryVO vo) {
		return dao.update(vo);
	}

	@Override
	public CategoryVO select(CategoryVO vo) {
		return dao.select(vo);
	}

	@Override
	public List<CategoryVO> selectList(CategoryVO vo) {
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
