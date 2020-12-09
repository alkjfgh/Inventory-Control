package com.inventory.app.domain;

public class BuyItemVO {
	private ItemVO item;
	private long buyCnt;

	public BuyItemVO() {
		super();
	}

	public BuyItemVO(ItemVO item, long buyCnt) {
		super();
		this.item = item;
		this.buyCnt = buyCnt;
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
		result = prime * result + ((item == null) ? 0 : item.hashCode());
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
		BuyItemVO other = (BuyItemVO) obj;
		if (item == null) {
			if (other.item != null)
				return false;
		} else if (!item.equals(other.item))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BuyItemVO [item=" + item + ", buyCnt=" + buyCnt + "]";
	}

}
