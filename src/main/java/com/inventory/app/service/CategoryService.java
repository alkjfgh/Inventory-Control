package com.inventory.app.service;

import java.util.List;

import com.inventory.app.domain.CategoryVO;

public interface CategoryService {
	public int insert(CategoryVO vo);

	public int delete(CategoryVO vo);
	
	public int update(CategoryVO vo);
	
	public CategoryVO select(CategoryVO vo);
	
	public List<CategoryVO> selectList(CategoryVO vo);

	public int deleteAll();
	
	public int selectCnt();
}
