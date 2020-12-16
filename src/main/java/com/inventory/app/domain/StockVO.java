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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (int) (categorySeq ^ (categorySeq >>> 32));
		result = prime * result + (int) (itemSeq ^ (itemSeq >>> 32));
		result = prime * result + (int) (shopSeq ^ (shopSeq >>> 32));
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
		StockVO other = (StockVO) obj;
		if (categorySeq != other.categorySeq)
			return false;
		if (itemSeq != other.itemSeq)
			return false;
		if (shopSeq != other.shopSeq)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "StockVO [shopSeq=" + shopSeq + ", categorySeq=" + categorySeq + ", itemSeq=" + itemSeq + ", total="
				+ total + ", remain=" + remain + ", necessity=" + necessity + ", sold=" + sold + "]";
	}

}
