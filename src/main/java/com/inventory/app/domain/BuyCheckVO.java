package com.inventory.app.domain;

public class BuyCheckVO {
	private ShopVO shop;
	private CategoryVO category;
	private ItemVO item;
	private long buyCnt;

	public BuyCheckVO(ShopVO shop, CategoryVO category, ItemVO item, long buyCnt) {
		super();
		this.shop = shop;
		this.category = category;
		this.item = item;
		this.buyCnt = buyCnt;
	}

	public ShopVO getShop() {
		return shop;
	}

	public void setShop(ShopVO shop) {
		this.shop = shop;
	}

	public CategoryVO getCategory() {
		return category;
	}

	public void setCategory(CategoryVO category) {
		this.category = category;
	}

	public ItemVO getItem() {
		return item;
	}

	public void setItem(ItemVO item) {
		this.item = item;
	}

	public long getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(long buyCnt) {
		this.buyCnt = buyCnt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((category == null) ? 0 : category.hashCode());
		result = prime * result + ((item == null) ? 0 : item.hashCode());
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
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		if (item == null) {
			if (other.item != null)
				return false;
		} else if (!item.equals(other.item))
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
		return "buyCheckVO [shop=" + shop + ", category=" + category + ", item=" + item + ", buyCnt=" + buyCnt + "]";
	}

}
