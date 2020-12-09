package com.inventory.app.domain;

import java.util.List;

public class BuyCheckVO {
	private ShopVO shop;
	private List<BuyItemVO> buyItemList;

	public BuyCheckVO() {
		super();
	}

	public BuyCheckVO(ShopVO shop, List<BuyItemVO> buyItemList) {
		super();
		this.shop = shop;
		this.buyItemList = buyItemList;
	}

	public ShopVO getShop() {
		return shop;
	}

	public void setShop(ShopVO shop) {
		this.shop = shop;
	}

	public List<BuyItemVO> getBuyItemList() {
		return buyItemList;
	}

	public void setBuyItemList(List<BuyItemVO> buyItemList) {
		this.buyItemList = buyItemList;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((buyItemList == null) ? 0 : buyItemList.hashCode());
		result = prime * result + ((shop == null) ? 0 : shop.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BuyCheckVO other = (BuyCheckVO) obj;
		if (buyItemList == null) {
			if (other.buyItemList != null)
				return false;
		} else if (!buyItemList.equals(other.buyItemList))
			return false;
		if (shop == null) {
			if (other.shop != null)
				return false;
		} else if (!shop.equals(other.shop))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BuyCheckVO [shop=" + shop + ", buyItemList=" + buyItemList + "]";
	}

}
