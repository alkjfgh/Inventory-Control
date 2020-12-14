package com.inventory.app.domain;

import java.util.List;

public class SoldCategoryVO {
	private CategoryVO category;
	private List<SoldLogVO> soldLogList;

	public SoldCategoryVO() {
		super();
	}

	public SoldCategoryVO(CategoryVO category, List<SoldLogVO> soldLogList) {
		super();
		this.category = category;
		this.soldLogList = soldLogList;
	}

	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public List<SoldLogVO> getSoldLogList() {
		return soldLogList;
	}

	public void setSoldLogList(List<SoldLogVO> soldLogList) {
		this.soldLogList = soldLogList;
	}

	@Override
	public String toString() {
		return "SoldCategoryVO [category=" + category + ", soldLogList=" + soldLogList + "]";
	}

}
