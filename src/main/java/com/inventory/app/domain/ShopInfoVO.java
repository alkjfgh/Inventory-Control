package com.inventory.app.domain;

import java.util.List;

public class ShopInfoVO {
	private ShopVO shop;
	private List<ItemInfoVO> itemInfoList;

	public ShopInfoVO() {
		super();
	}

	public ShopInfoVO(ShopVO shop, List<ItemInfoVO> itemInfoList) {
		super();
		this.shop = shop;
		this.itemInfoList = itemInfoList;
	}

	public ShopVO getShop() {
		return shop;
	}

	public void setShop(ShopVO shop) {
		this.shop = shop;
	}

	public List<ItemInfoVO> getItemInfoList() {
		return itemInfoList;
	}

	public void setItemInfoList(List<ItemInfoVO> itemInfoList) {
		this.itemInfoList = itemInfoList;
	}

	@Override
	public String toString() {
		return "ShopInfoVO [shop=" + shop + ", itemInfoList=" + itemInfoList + "]";
	}

}
