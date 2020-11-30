package com.inventory.app.domain;

import java.util.List;

public class ItemListVO {
	private CategoryVO category;
	private int size;
	private List<ItemInfoVO> itemList;

	public ItemListVO() {
		super();
	}

	public ItemListVO(CategoryVO category, int size, List<ItemInfoVO> itemList) {
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

	public List<ItemInfoVO> getItemList() {
		return itemList;
	}

	public void setItemList(List<ItemInfoVO> itemList) {
		this.itemList = itemList;
	}

	@Override
	public String toString() {
		return "ItemListVO [category=" + category + ", size=" + size + ", itemList=" + itemList + "]";
	}

}
