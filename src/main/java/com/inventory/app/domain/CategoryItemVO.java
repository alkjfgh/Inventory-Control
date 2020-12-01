package com.inventory.app.domain;

import java.util.List;

public class CategoryItemVO {
	private CategoryVO category;
	private int size;
	private List<ItemVO> itemList;

	public CategoryItemVO(CategoryVO category, int size, List<ItemVO> itemList) {
		super();
		this.category = category;
		this.size = size;
		this.itemList = itemList;
	}

	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<ItemVO> getItemList() {
		return itemList;
	}

	public void setItemList(List<ItemVO> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "CategoryItemVO [category=" + category + ", size=" + size + ", itemList=" + itemList + "]";
	}

}
