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
	private long necessity;
	private long sold;
	private long autoSup;
	private int start;

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

	public long getNecessity() {
		return necessity;
	}

	public void setNecessity(long necessity) {
		this.necessity = necessity;
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

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (categorySeq ^ (categorySeq >>> 32));
		result = prime * result + (int) (itemSeq ^ (itemSeq >>> 32));
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
		ItemInfoVO other = (ItemInfoVO) obj;
		if (categorySeq != other.categorySeq)
			return false;
		if (itemSeq != other.itemSeq)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ItemInfoVO [categorySeq=" + categorySeq + ", categoryName=" + categoryName + ", itemSeq=" + itemSeq
				+ ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", total=" + total + ", remain=" + remain
				+ ", necessity=" + necessity + ", sold=" + sold + ", autoSup=" + autoSup + "]";
	}

}
