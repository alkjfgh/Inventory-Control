package com.inventory.app.domain;

import java.util.List;

public class CategoryVO {
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<ItemTestVO> getItemList() {
		return itemList;
	}
	public void setItemList(List<ItemTestVO> itemList) {
		this.itemList = itemList;
	}
	int size;
	String name;
	List<ItemTestVO> itemList;
}
