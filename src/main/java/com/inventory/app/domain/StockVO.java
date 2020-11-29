package com.inventory.app.domain;

public class StockVO {
	long shopSeq;
	long itemSeq;
	long total;
	long remain;
	long necessity;
	long sold;

	public StockVO() {
		super();
	}

	public StockVO(long shopSeq, long itemSeq, long total, long remain, long necessity, long sold) {
		super();
		this.shopSeq = shopSeq;
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
		result = prime * result + (int) (itemSeq ^ (itemSeq >>> 32));
		result = prime * result + (int) (necessity ^ (necessity >>> 32));
		result = prime * result + (int) (remain ^ (remain >>> 32));
		result = prime * result + (int) (shopSeq ^ (shopSeq >>> 32));
		result = prime * result + (int) (sold ^ (sold >>> 32));
		result = prime * result + (int) (total ^ (total >>> 32));
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
		if (itemSeq != other.itemSeq)
			return false;
		if (necessity != other.necessity)
			return false;
		if (remain != other.remain)
			return false;
		if (shopSeq != other.shopSeq)
			return false;
		if (sold != other.sold)
			return false;
		if (total != other.total)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "StockVO [shopSeq=" + shopSeq + ", itemSeq=" + itemSeq + ", total=" + total + ", remain=" + remain
				+ ", necessity=" + necessity + ", sold=" + sold + "]";
	}

}
