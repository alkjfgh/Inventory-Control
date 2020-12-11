package com.inventory.app.domain;

public class SoldLogVO {
	private long logCount;
	private long logSold;
	private long shopSeq;
	private long categorySeq;
	private long itemSeq;
	private long week;
	private long month;
	private long start;
	private long end;

	public SoldLogVO() {
		super();
	}

	public SoldLogVO(long logCount, long logSold, long shopSeq, long categorySeq, long itemSeq) {
		super();
		this.logCount = logCount;
		this.logSold = logSold;
		this.shopSeq = shopSeq;
		this.categorySeq = categorySeq;
		this.itemSeq = itemSeq;
	}

	public long getLogCount() {
		return logCount;
	}

	public void setLogCount(long logCount) {
		this.logCount = logCount;
	}

	public long getLogSold() {
		return logSold;
	}

	public void setLogSold(long logSold) {
		this.logSold = logSold;
	}

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

	public long getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(long itemSeq) {
		this.itemSeq = itemSeq;
	}

	public long getWeek() {
		return week;
	}

	public void setWeek(long week) {
		this.week = week;
	}

	public long getMonth() {
		return month;
	}

	public void setMonth(long month) {
		this.month = month;
	}

	public long getStart() {
		return start;
	}

	public void setStart(long start) {
		this.start = start;
	}

	public long getEnd() {
		return end;
	}

	public void setEnd(long end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "SoldLogVO [logCount=" + logCount + ", logSold=" + logSold + ", shopSeq=" + shopSeq + ", categorySeq="
				+ categorySeq + ", itemSeq=" + itemSeq + ", week=" + week + ", month=" + month + ", start=" + start
				+ ", end=" + end + "]";
	}

}
