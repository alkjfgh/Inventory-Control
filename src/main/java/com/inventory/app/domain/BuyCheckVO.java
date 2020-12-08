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
	public String toString() {
		return "buyCheckVO [shop=" + shop + ", category=" + category + ", item=" + item + ", buyCnt=" + buyCnt + "]";
	}

}
