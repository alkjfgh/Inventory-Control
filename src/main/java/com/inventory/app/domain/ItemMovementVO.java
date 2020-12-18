package com.inventory.app.domain;

public class ItemMovementVO {
	private long shopSeq;
	private String shopName;
	private long shopCount;
	private long categorySeq;
	private String categoryName;
	private long itemSeq;
	private String itemName;
	private long stockMove;
	private int start;

	public ItemMovementVO() {
		super();
	}

	public ItemMovementVO(long shopCount, long categorySeq, long itemSeq) {
		super();
		this.shopCount = shopCount;
		this.categorySeq = categorySeq;
		this.itemSeq = itemSeq;
	}

	public long getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(long shopSeq) {
		this.shopSeq = shopSeq;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public long getShopCount() {
		return shopCount;
	}

	public void setShopCount(long shopCount) {
		this.shopCount = shopCount;
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

	public long getStockMove() {
		return stockMove;
	}

	public void setStockMove(long stockMove) {
		this.stockMove = stockMove;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	@Override
	public String toString() {
		return "ItemMovementVO [shopSeq=" + shopSeq + ", shopName=" + shopName + ", shopCount=" + shopCount
				+ ", categorySeq=" + categorySeq + ", categoryName=" + categoryName + ", itemSeq=" + itemSeq
				+ ", itemName=" + itemName + ", stockMove=" + stockMove + "]";
	}

}
