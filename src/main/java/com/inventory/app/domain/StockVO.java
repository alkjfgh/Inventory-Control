package com.inventory.app.domain;

public class StockVO {
	private long shopSeq;
	private long categorySeq;
	private long itemSeq;
	private long total;
	private long remain;
	private long necessity;
	private long sold;

	public StockVO() {
		super();
	}

	public StockVO(long shopSeq, long categorySeq, long itemSeq, long total, long remain, long necessity, long sold) {
		super();
		this.shopSeq = shopSeq;
		this.categorySeq = categorySeq;
		this.itemSeq = itemSeq;
		this.total = total;
		this.remain = remain;
		this.necessity = necessity;
		this.sold = sold;
	}

	public long getShopSeq() {
		return shopSeq;
	}

	public void setShopSeq(long shopSeq) {
		this.shopSeq = shopSeq;
	}

	public long getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(long itemSeq) {
		this.itemSeq = itemSeq;
	}

	public long getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(long categorySeq) {
		this.categorySeq = categorySeq;
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

	@Override
	public String toString() {
		return "StockVO [shopSeq=" + shopSeq + ", categorySeq=" + categorySeq + ", itemSeq=" + itemSeq + ", total="
				+ total + ", remain=" + remain + ", necessity=" + necessity + ", sold=" + sold + "]";
	}

}
