package com.inventory.app.domain;

import java.util.List;

public class ShopInfoVO {
	private ShopVO shop;
	private int size;
	private List<ItemListVO> categoryList;
	public ShopInfoVO() {
		super();
	}
	public ShopInfoVO(ShopVO shop, int size, List<ItemListVO> categoryList) {
		super();
		this.shop = shop;
		this.size = size;
		this.categoryList = categoryList;
	}
	public ShopVO getShop() {
		return shop;
	}
	public void setShop(ShopVO shop) {
		this.shop = shop;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<ItemListVO> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<ItemListVO> categoryList) {
		this.categoryList = categoryList;
	}

	@Override
	public String toString() {
		return "ShopInfoVO [shop=" + shop + ", size=" + size + ", categoryList=" + categoryList + "]";
	}

}
