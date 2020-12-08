package com.inventory.app.domain;

import java.util.Arrays;
import java.util.Date;

public class ItemVO {
	private Long itemSeq;
	private Long categorySeq;
	private String itemName;
	private Long itemPrice;
	private Date itemRegdate;
	private Date itemFwdate;
	private String itemDesc;
	private String itemMaker;
	private byte[] itemImg;

	public ItemVO() {
		super();
	}

	public ItemVO(Long categorySeq, String itemName, Long itemPrice, String itemMaker) {
		super();
		this.categorySeq = categorySeq;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemMaker = itemMaker;
	}

	public Long getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(Long itemSeq) {
		this.itemSeq = itemSeq;
	}

	public Long getCategorySeq() {
		return categorySeq;
	}

	public void setCategorySeq(Long categorySeq) {
		this.categorySeq = categorySeq;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Long getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Long itemPrice) {
		this.itemPrice = itemPrice;
	}

	public Date getItemRegdate() {
		return itemRegdate;
	}

	public void setItemRegdate(Date itemRegdate) {
		this.itemRegdate = itemRegdate;
	}

	public Date getItemFwdate() {
		return itemFwdate;
	}

	public void setItemFwdate(Date itemFwdate) {
		this.itemFwdate = itemFwdate;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemMaker() {
		return itemMaker;
	}

	public void setItemMaker(String itemMaker) {
		this.itemMaker = itemMaker;
	}

	public byte[] getItemImg() {
		return itemImg;
	}

	public void setItemImg(byte[] itemImg) {
		this.itemImg = itemImg;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categorySeq == null) ? 0 : categorySeq.hashCode());
		result = prime * result + ((itemDesc == null) ? 0 : itemDesc.hashCode());
		result = prime * result + ((itemFwdate == null) ? 0 : itemFwdate.hashCode());
		result = prime * result + Arrays.hashCode(itemImg);
		result = prime * result + ((itemMaker == null) ? 0 : itemMaker.hashCode());
		result = prime * result + ((itemName == null) ? 0 : itemName.hashCode());
		result = prime * result + ((itemPrice == null) ? 0 : itemPrice.hashCode());
		result = prime * result + ((itemRegdate == null) ? 0 : itemRegdate.hashCode());
		result = prime * result + ((itemSeq == null) ? 0 : itemSeq.hashCode());
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
		ItemVO other = (ItemVO) obj;
		if (categorySeq == null) {
			if (other.categorySeq != null)
				return false;
		} else if (!categorySeq.equals(other.categorySeq))
			return false;
		if (itemDesc == null) {
			if (other.itemDesc != null)
				return false;
		} else if (!itemDesc.equals(other.itemDesc))
			return false;
		if (itemFwdate == null) {
			if (other.itemFwdate != null)
				return false;
		} else if (!itemFwdate.equals(other.itemFwdate))
			return false;
		if (!Arrays.equals(itemImg, other.itemImg))
			return false;
		if (itemMaker == null) {
			if (other.itemMaker != null)
				return false;
		} else if (!itemMaker.equals(other.itemMaker))
			return false;
		if (itemName == null) {
			if (other.itemName != null)
				return false;
		} else if (!itemName.equals(other.itemName))
			return false;
		if (itemPrice == null) {
			if (other.itemPrice != null)
				return false;
		} else if (!itemPrice.equals(other.itemPrice))
			return false;
		if (itemRegdate == null) {
			if (other.itemRegdate != null)
				return false;
		} else if (!itemRegdate.equals(other.itemRegdate))
			return false;
		if (itemSeq == null) {
			if (other.itemSeq != null)
				return false;
		} else if (!itemSeq.equals(other.itemSeq))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ItemVO [itemSeq=" + itemSeq + ", categorySeq=" + categorySeq + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", itemRegdate=" + itemRegdate + ", itemFwdate=" + itemFwdate + ", itemDesc=" + itemDesc
				+ ", itemMaker=" + itemMaker + ", itemImg=" + Arrays.toString(itemImg) + "]";
	}

}