package com.inventory.app.domain;

public class ItemInfoVO {
	private long shopSeq;
	private long categorySeq;
	private String categoryName;
	private long itemSeq;
	private String itemName;
	private long itemPrice;
	private long total;
	private long remain;
	private long necssity;
	private long sold;
	private long autoSup;

	public long getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(long shopSeq) {
		this.shopSeq = shopSeq;
	}

	public long getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(long categorySeq) {
		this.categorySeq = categorySeq;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public long getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(long itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public long getRemain() {
		return remain;
	}

	public void setRemain(long remain) {
		this.remain = remain;
	}

	public long getNecssity() {
		return necssity;
	}

	public void setNecssity(long necssity) {
		this.necssity = necssity;
	}

	public long getSold() {
		return sold;
	}

	public void setSold(long sold) {
		this.sold = sold;
	}

	public long getAutoSup() {
		return autoSup;
	}

	public void setAutoSup(long autoSup) {
		this.autoSup = autoSup;
	}

	@Override
	public String toString() {
		return "ItemInfoVO [shopSeq=" + shopSeq + ", categorySeq=" + categorySeq + ", categoryName=" + categoryName
				+ ", itemSeq=" + itemSeq + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", total=" + total
				+ ", remain=" + remain + ", necssity=" + necssity + ", sold=" + sold + ", autoSup=" + autoSup + "]";
	}

}
